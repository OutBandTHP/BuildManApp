class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.integer :unit_no
      t.string :floor
      t.references :project, null: false, foreign_key: true
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
