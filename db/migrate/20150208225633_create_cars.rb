class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :odometer
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :cars, :users
  end
end
