class SlideshowMapping < ApplicationRecord
    belongs_to :screen
    belongs_to :slideshow
  
    attribute :duration, :integer, default: 10
  
end
