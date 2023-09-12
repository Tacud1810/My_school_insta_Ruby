class Post < ApplicationRecord

	belongs_to :user

	validates :title, presence: true, length: {minimum:5, maximum: 100}
	validates :description, presence: true, length: {minimum:5, maximum: 500}
	validates :keywords, presence: true, length: {minimum:5}

	has_many_attached :images

	def self.order_by_created_at_desc
		order(created_at: :desc)
	end
end
