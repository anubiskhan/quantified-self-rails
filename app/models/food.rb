class Food < ApplicationRecord
  validates_presence_of :name, :calories
  validates :name, uniqueness: true
end
