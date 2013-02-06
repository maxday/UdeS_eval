class User < ActiveRecord::Base
  #roles for Cancan
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :teams

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
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

  scope :only_students, joins(:roles).where("roles.name = ?", "Student")

end
