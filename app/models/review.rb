class Review < ActiveRecord::Base
  belongs_to :bathroom

  validates :bathroom, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, in: 1..5 }
  validates :body, presence: true
end
