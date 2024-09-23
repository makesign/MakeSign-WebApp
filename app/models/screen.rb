class Screen < ApplicationRecord
  has_many :slideshow_mappings, dependent: :destroy
  has_many :slideshows, through: :slideshow_mappings

  validates :name, presence: true, uniqueness: true
end