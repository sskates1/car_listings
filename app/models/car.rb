class Car < ActiveRecord::Base
  validates :manufacturer, presence: true
  validates :color, presence: true
  validates :year, :mileage,
            presence: true,
            numericality: { only_integer: true }

  belongs_to :manufacturer
end
