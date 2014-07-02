class Manufacturer < ActiveRecord::Base
  validates :name, presence: true
  validates :country,
    presence: true,
    uniqueness: { scope: :name }

  has_many :cars
end
