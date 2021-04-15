class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.string :model
      t.string :type
      t.string :mileage
      t.string :year
      t.integer :user_id
    end 
  end
end
