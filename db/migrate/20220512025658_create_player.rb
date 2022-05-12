class CreatePlayer < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :fname
      t.string :lname
      t.integer :jersey
      t.boolean :healthy
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
