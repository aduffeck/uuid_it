class CreateUuids < ActiveRecord::Migration
  def self.up
    create_table :uuids do |t|
      t.string :uuid
      t.integer :uuidable_id
      t.string :uuidable_type, :limit => 40
    end
    add_index :uuids, [:uuidable_id, :uuidable_type]
  end

  def self.down
    drop_table :uuids
  end
end
