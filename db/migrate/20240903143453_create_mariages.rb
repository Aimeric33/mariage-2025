class CreateMariages < ActiveRecord::Migration[7.1]
  def change
    create_table :mariages do |t|
      t.string :name

      t.timestamps
    end
  end
end
