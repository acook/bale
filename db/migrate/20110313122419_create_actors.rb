class CreateActors < ActiveRecord::Migration
  def self.up
    create_table :actors do |t|
      t.string :address
      t.string :name
      t.string :known_contacts
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :actors
  end
end
