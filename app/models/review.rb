class Review < ActiveRecord::Base
  belongs_to :bathroom

  validates :bathroom, presence: true
  validates :rating, presence: true, numericality: true, inclusion: { in: 1..5, message: "must be between 1 - 5" }
  validates :body, presence: true
end
