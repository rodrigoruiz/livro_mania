#encoding: utf-8

#require 'hpricot'
require 'open-uri'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :cpf, :cep, :address,
                  :latitude, :longitude
  
  before_validation :fill_address
    
  geocoded_by :address
  after_validation :geocode
  
  validates :name, :presence => true
  validates :cpf,  :presence => true, :uniqueness => true
  validates :cep,  :presence => true, :format => { :with => /^[0-9]{5}-[0-9]{3}$/ }
  
  validates_with CpfValidator
  
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id' 
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'receiver_id'
  
  has_many :my_books, :class_name => 'MyBook'
  has_and_belongs_to_many :books
  
  has_many :given_ratings, :class_name => 'Rating', :foreign_key => 'evaluator_id' 
  has_many :received_ratings, :class_name => 'Rating', :foreign_key => 'rated_user_id'
  
  def sort_by_distance (user, users)
    users.sort_by{|a| user.distance_to(a)}
  end

  def max_trocas (user)
    x=0
    user.my_books.each do |user_my_book|
      if(books.include?(user_my_book.book))
        x+=1
      end
    end
    y=0
    my_books.each do |my_book|
      if(user.books.include?(my_book.book))
        y+=1
      end
    end
    [x,y].min
  end
  
  private
    def fill_address
      url = "http://feliperoberto.com.br/api/correios/cep.php?cep="+self.cep
      str = Hpricot(open(url)).to_s()
      list = str.split('"')
      
      street_list = list[3].split('-')
      
      list[3] = street_list[0]
      
      correct(list[3])
      correct(list[7])
      correct(list[15])
      correct(list[19])

      self.address = list[3]+","+list[7]+","+list[15]+","+list[19] if list[3] && list[7] && list[15]
    end
    
    def correct(address)
      return if address.nil?
      address.gsub!('\u00c1', "Á")
      address.gsub!('\u00c2', "Â")
      address.gsub!('\u00c9', "É")
      address.gsub!('\u00ca', "Ê")
      address.gsub!('\u00cd', "Í")
      address.gsub!('\u00d3', "Ó")
      address.gsub!('\u00d4', "Ô")
      address.gsub!('\u00da', "Ú")
      address.gsub!('\u00e0', "à")
      address.gsub!('\u00e1', "á")
      address.gsub!('\u00e2', "â")
      address.gsub!('\u00e3', "ã")
      address.gsub!('\u00e7', "ç")
      address.gsub!('\u00e9', "é")
      address.gsub!('\u00ea', "ê")
      address.gsub!('\u00ed', "í")
      address.gsub!('\u00ee', "î")
      address.gsub!('\u00f3', "ó")
      address.gsub!('\u00f4', "ô")
      address.gsub!('\u00f5', "õ")
      address.gsub!('\u00fa', "ú")
    end
end
