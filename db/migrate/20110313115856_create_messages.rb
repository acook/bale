class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :priority
      t.text :body
      t.string :type
      t.references :sender
      t.references :receiver
      t.text :route
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
