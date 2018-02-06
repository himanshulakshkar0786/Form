class Post < ApplicationRecord

	attr_accessor :type

	acts_as_votable

	has_attached_file :image, styles: { large: "600*600>", medium: "200*200>", small: "100*100>"}
  	validates_attachment_content_type :image, content_type: ["image/jpeg", "image/gif", "image/png"]

	has_attached_file :audio
	validates_attachment :audio, content_type: { content_type: /\Aaudio\/.*\z/ }

	has_attached_file :video

	belongs_to :user
	belongs_to :category
	has_many :comments, as: :commentable, dependent: :destroy
	
	validates :title, :description, presence: true
	validates :title, length: {maximum: 20}
	validates :description, length: {maximum: 80}
end