class Post < ApplicationRecord

	acts_as_votable
	
	belongs_to :user
	belongs_to :category
	has_many :comments, dependent: :destroy
	
	validates :title, :description, presence: true
	validates :title, length: {maximum: 20}
	validates :description, length: {maximum: 50}
end