class User < ActiveRecord::Base
  #roles for Cancan
  has_and_belongs_to_many :roles
  has_many :teams
  has_many :affectations, :through => :teams

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :matricule, :fullname, :encrypted_password
  # attr_accessible :title, :body


  validates :username,
            :presence => true,
            :uniqueness => true

  validates :email,
            :presence => true,
            :uniqueness => true

  #get a roleId by name
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  #get the team name for a given term
  def team?(term)
    return Team.find(Affectation.where(:user_id => self, :term_id => term).first.team_id)
  end

  #get all marks given to other students for a given period
  def all_marks_received?(period)
     return Mark.where(:student_to_id => self, :period_id => period)
  end

  #get all marks received from other students for a given period
  def all_marks_given?(period)
    return Mark.where(:student_from_id => self, :period_id => period)
  end

  #get sof average (real average minus max and min)
  def soft_average?(period)
    allMarks = Mark.where(:student_to_id => self, :period_id => period)
    array = Array.new
    allMarks.each do |single_mark|
      array.push(single_mark.value)
    end
    array.sort

    #delete minimum and maximum
    array.delete_at(0)
    if array.size != 0
      array.delete_at(array.size-1)
    end


    # no marks left ?-> error
    if array.size == 0
      return 0
    end
    return array.sum.to_f / array.size

  end


  def final?(period)
     if period.all_question.count == 0
       return false
     end
     return self.all_marks_received?(period).count == (self.team?(period.term_id).how_many?(period.term_id) - 1) * period.all_question.count
  end

  scope :only_students, joins(:roles).where("roles.name = ?", "Student")

  def pourcent_completed?(period)
    nb_members = self.team?(period.term_id).all_members_but_me?(period.term_id, self).count
    nb_marks =  Mark.where(:period_id => period, :student_from_id => self).count
    nb_question = period.all_question.count

    #avoid divided by 0 error
    if nb_members * nb_question == 0
      return 0
    end

    return nb_marks * 100 / (nb_members * nb_question)
  end

  def real_name
    return self.fullname.gsub(",","")
  end

  def average_mark_from_student(user, period)
    all_marks = Mark.where(:student_from_id => user, :student_to_id => self, :period_id => period)
    num = all_marks.sum :value
    return (num*1.00)/period.all_question.count
  end

end
