class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient  }

  # def self.crazy
  #   where(description: "crazy")
  # end
end
