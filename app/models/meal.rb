class Meal < ApplicationRecord
  validates_presence_of :name
  validates :name, uniqueness: true

  has_many :meal_foods, dependent: :destroy
  has_many :foods, through: :meal_foods
end
