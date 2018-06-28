class Food < ApplicationRecord
  validates_presence_of :name, :calories
  validates :name, uniqueness: true

  has_many :meal_foods, dependent: :destroy
  has_many :meals, through: :meal_foods
end
