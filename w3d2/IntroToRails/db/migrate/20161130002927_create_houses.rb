class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :adress, null: false
    end
  end
end
