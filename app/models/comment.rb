class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post

	has_attached_file :image, styles: { large: "600*600>", medium: "300*300>"}
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	validates :description, presence: true
	validates :description, length: { maximum: 50 }
end
