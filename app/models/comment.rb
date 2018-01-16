class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :commentable, polymorphic: true
  	has_many :comments, as: :commentable

	has_attached_file :image, styles: { large: "600*600>", medium: "300*300>"}
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	validates :description, presence: true, length: { maximum: 50 }
end
