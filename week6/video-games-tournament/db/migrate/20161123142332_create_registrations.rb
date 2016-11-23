class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.belongs_to :tournament, index: true
      t.belongs_to :player, index: true

      t.timestamps null: false
    end
  end
end
