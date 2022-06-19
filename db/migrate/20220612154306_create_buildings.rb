class CreateBuildings < ActiveRecord::Migration[7.0]
  def change
    create_table :buildings do |t|
      t.string :name
      t.text :address
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end