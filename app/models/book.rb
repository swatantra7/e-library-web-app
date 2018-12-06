class Book < ApplicationRecord

  has_one_attached :images
  has_one_attached :record_attachment

  belongs_to :subject

  has_many :books_categories
  has_many :categories, through: :books_categories

  delegate :name, to: :subject, prefix: true, allow_nil: true


end
