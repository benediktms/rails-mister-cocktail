class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient, dependent: :destroy
  validates :description, presence: true
  validates :cocktail_id, presence: true, uniqueness: { scope: :ingredient_id }
end
