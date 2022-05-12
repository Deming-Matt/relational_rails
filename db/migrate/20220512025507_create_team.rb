class CreateTeam < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :roster_spots
      t.boolean :full_roster

      t.timestamps
    end
  end
end
