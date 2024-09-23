class Slide < ApplicationRecord
  has_one_attached :image
  has_many :slide_mappings, dependent: :destroy
  has_many :slideshows, through: :slide_mappings

  validates :name, presence: true, uniqueness: true
end
