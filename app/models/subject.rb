class Subject < ApplicationRecord

  has_one_attached :images
  
  has_many :books

end
