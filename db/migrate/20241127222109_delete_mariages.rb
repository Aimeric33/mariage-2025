class DeleteMariages < ActiveRecord::Migration[7.1]
  def change
    remove_reference :guests, :mariage, foreign_key: true
    drop_table :mariages
  end
end
