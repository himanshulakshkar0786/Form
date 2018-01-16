class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login]

  has_attached_file :image, styles: { large: "600*600>", medium: "300*300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  acts_as_voter

	has_many :posts, dependent: :destroy
	has_many :comments
  belongs_to :country
  belongs_to :state
  belongs_to :city
  
	validates :username, :name, presence: true
	validates :username, uniqueness: {case_sensitive: false}

  attr_accessor :login

	def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

end