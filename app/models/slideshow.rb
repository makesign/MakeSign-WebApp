class Slideshow < ApplicationRecord
  has_many :slide_mappings, dependent: :destroy
  has_many :slides, through: :slide_mappings
  
  has_many :slideshow_mappings, dependent: :destroy
  has_many :slideshows, through: :slideshow_mappings

  accepts_nested_attributes_for :slide_mappings, allow_destroy: true

  validates :name, presence: true, uniqueness: true
end
