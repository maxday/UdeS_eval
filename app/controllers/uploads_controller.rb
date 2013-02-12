# encoding: UTF-8
class UploadsController < ApplicationController


  def index

  end

  def create
    require 'fileutils'

    time = Time.now
    file_name = time.to_formatted_s(:number)

    uploaded_io = params[:file_upload][:eval].tempfile
    File.open(Rails.root.join('public', 'uploads', "#{file_name}.xlsx"), 'wb') do |file|
      file.write(uploaded_io.read)
      file.close
    end

    excel = RubyXL::Parser.parse(Rails.root.to_s + "/public/uploads/#{file_name}.xlsx")
    sheet = excel.worksheets[0]

    @errors = Array.new
    @infos = Array.new
    users_to_create = Array.new
    is_error = false

    student_role = Role.where(:name => "Student")

    data = sheet.get_table(["Cip"])

    # 2 = skip header
    2.upto(data["Cip"].count-2) do |line|
      #load data into specific vars
      username = data["Cip"][line]
      matricule = data["Matricule"][line]
      fullname = data["Nom"][line]
      email = data["Courriel"][line]
      team = data["Team"][line]
      term = data["Session"][line]
      year = data["Année"][line]

      #year check
      if !checkYearExists?(year)
        @errors.push "#{year} n'existe pas"
        is_error = true
      end

      #term check
      if !checkTermExists?(term, year)
        @errors.push "#{term} n'existe pas"
        is_error = true
      end

      #team check
      if !checkTeamExists?(team)
        @errors.push "#{team} n'existe pas"
        is_error = true
      end

      new_user = create_user_from_excel(username, email, matricule, fullname)
      new_user.role_ids = student_role
      users_to_create.push new_user
      if !new_user.valid?
        @errors.push "Importation de : #{fullname} KO - arret"
        is_error=1
      end

    end

    #delete same errors
    @errors = @errors.uniq
    if !is_error
      i=2
      users_to_create.each do |single_user|
        if single_user.save
          @infos.push "Importation de : #{single_user.fullname} OK"
        end
        team = data["Team"][i]
        term = data["Session"][i]
        year = data["Année"][i]

        new_affectation = create_affectation_from_excel(single_user, team, term, year)
        new_affectation.save
        i = i+1
      end
      @infos.push "SUCCES : #{i-2} utilisateur importes"
    else
      @errors.push "ECHEC rien n'a ete importe"
    end
    session[:infos] = @infos
    session[:errors] = @errors
    redirect_to uploads_path
  end

  def checkTeamExists?(team)
    return Team.where(:name => team).count == 1
  end

  def checkYearExists?(year)
    return Year.where(:name => year).count == 1
  end

  def checkTermExists?(term, year)
    return Term.where(:name => term, :year_id => Year.where(:name => year)).count == 1
  end

  def create_user_from_excel(username, email, matricule, fullname)
    return User.new(:username => username,
                    :email => email,
                    :matricule => matricule,
                    :fullname => fullname,
                    :password => "aaaaaaaa")
  end

  def create_affectation_from_excel(user, team, term, year)
    return Affectation.new(:user_id => user.id,
                           :team_id => Team.where(:name => team).first.id,
                           :term_id => Term.where(:name => term, :year_id => Year.where(:name =>year).first).first.id)
  end
end