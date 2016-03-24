class Bathroom < ActiveRecord::Base
  has_many :reviews

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, length: { is: 5 }, numericality: true
end
