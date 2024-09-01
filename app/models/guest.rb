class Guest < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  enum dinner_presence: { dinner_invited: 0, dinner_yes: 1, dinner_no: 2 }
  enum brunch_presence: { brunch_invited: 0, brunch_yes: 1, brunch_no: 2 }
  enum food_restriction: { no_restriction: 0, vegetarian: 1, pescetarian: 2, vegan: 3 }

  def self.ransackable_attributes(auth_object = nil)
    ["address", "brunch_presence", "child", "created_at", "dinner_presence", "email", "first_name", "food_restriction", "id", "id_value", "last_name", "phone", "updated_at"]
  end
end
