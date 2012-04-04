class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :cpf, :cep
  # attr_accessible :title, :body
  
  validates :name, :presence => true
  validates :cpf, :presence => true, :uniqueness => true
  validates :cep, :presence => true, :format => { :with => /^[0-9]{5}-[0-9]{3}$/ }
  
  validates_with CpfValidator
end
