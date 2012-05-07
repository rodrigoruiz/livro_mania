class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :cpf, :cep, :address,
                  :latitude, :longitude

  #geocoded_by :address, :latitude => :lat, :longitude => :lon
  #after_validation :geocode
  
  validates :name, :presence => true
  validates :cpf,  :presence => true, :uniqueness => true
  validates :cep,  :presence => true, :format => { :with => /^[0-9]{5}-[0-9]{3}$/ }
  
  #validates :latitude, :presence => true
  #validates :longitude, :presence => true

  
  validates_with CpfValidator
  
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id' 
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'receiver_id'
  has_many :my_books, :class_name => 'MyBook'
  has_and_belongs_to_many :books
end
