class CreateGuests < ActiveRecord::Migration[7.1]
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone
      t.string :email
      t.boolean :child, default: false
      t.integer :dinner_presence, default: 0
      t.integer :brunch_presence, default: 0
      t.integer :food_restriction

      t.timestamps
    end
  end
end
