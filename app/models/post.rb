class Post < ApplicationRecord

	acts_as_votable

	has_attached_file :image, styles: { large: "600*600>", medium: "300*300>"}
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	belongs_to :user
	belongs_to :category
	has_many :comments, as: :commentable, dependent: :destroy
	
	validates :title, :description, presence: true
	validates :title, length: {maximum: 20}
	validates :description, length: {maximum: 50}
end