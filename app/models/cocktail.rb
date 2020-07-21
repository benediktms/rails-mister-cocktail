class Cocktail < ApplicationRecord
  has_many :doses, dependent: destroy
  validates :name, presence: true, uniqueness: true
end
