class Guest < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  enum dinner_presence: { invited: 0, yes: 1, no: 2 }
  enum brunch_presence: { invited: 0, yes: 1, no: 2 }
  enum food_restriction: { none: 0, vegetarian: 1, pescetarian: 2, vegan: 3 }
end
