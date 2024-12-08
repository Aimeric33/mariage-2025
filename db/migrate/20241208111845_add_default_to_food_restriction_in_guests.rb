class AddDefaultToFoodRestrictionInGuests < ActiveRecord::Migration[7.1]
  def change
    change_column_default :guests, :food_restriction, 0
  end
end
