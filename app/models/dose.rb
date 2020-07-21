class Dose < ApplicationRecord
  has_many :cocktails
  has_many :ingredients
end
