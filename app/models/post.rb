class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :title, :description, presence: true
	validates :title, length: {maximum: 20}
	validates :description, length: {maximum: 50}
end