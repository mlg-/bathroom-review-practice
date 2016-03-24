class Review < ActiveRecord::Base
  belongs_to :bathroom

  validates :body, presence: true
  validates :rating, presence: true, numericality: true, inclusion: { in: 1..5, message: "must be between 1 - 5" }
  validates :bathroom, presence: true
end
