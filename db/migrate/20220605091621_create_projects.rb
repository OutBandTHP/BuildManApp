class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :email
      t.text :address
      t.integer :no_buildings
      t.integer :no_units

      t.timestamps
    end
  end
end
