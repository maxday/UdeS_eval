class ExportsController < ApplicationController

  def index
    authorize! :check, :evaluation
    @period = Period.find(params[:id])

    @students = User.only_students
    @affectation = Affectation.where(:term_id => @period.term_id, :user_id => @students).pluck(:user_id)
    @students = User.where(:id => @affectation)

    require 'spreadsheet'
    export_file = Spreadsheet::Workbook.new
    first_sheet = export_file.create_worksheet :name => 'Notes eval_S7_S8'

    first_sheet.row(0).concat %w{Cip Matricule Nom Email Team Session Annee Periode Moyenne Moyenne_adoucie}



    format_valid = Spreadsheet::Format.new :pattern_fg_color => :green, :pattern => 1
    format_invalid = Spreadsheet::Format.new :pattern_fg_color => :orange, :pattern => 1

    @students.each_with_index do |single_student, index|
      row = first_sheet.row(index+1)

      avg = single_student.all_marks_received?(@period).average :value
      row.push single_student.username,
               single_student.matricule,
               single_student.fullname,
               single_student.email,
               single_student.team?(@period.term_id).name,
               Term.find(@period.term_id).name,
               Year.find(Term.find(@period.term_id).year_id).name,
               @period.name,
               avg,
               single_student.soft_average?(@period)
      if single_student.final?(@period)
        row.set_format(8, format_valid)
        row.set_format(9, format_valid)
      else
        row.set_format(8, format_invalid)
        row.set_format(9, format_invalid)
      end

    end

    time = Time.now.to_formatted_s(:number)
    @path = Rails.root.to_s + "/public/exports/#{time}-export.xls"
    export_file.write @path

  end



end