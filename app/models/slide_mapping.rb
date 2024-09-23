class SlideMapping < ApplicationRecord
  belongs_to :slideshow
  belongs_to :slide

  attribute :duration, :integer, default: 10
end
