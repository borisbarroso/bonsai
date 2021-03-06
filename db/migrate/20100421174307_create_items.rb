class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :unit_id

      t.decimal :unitary_cost, :precision => 14, :scale => 2
      t.decimal :price, :precision => 14, :scale => 2
      t.string :name
      t.string :description
      t.string :code, :limit => 100
      t.boolean :integer, :default => false # denormalized data
      t.boolean :stockable, :default => false
      t.boolean :active, :default => true
      t.string :discount #, :precision => 5, :scale => 2, :default => 0
      t.string :ctype, :limit => 20
      #t.boolean :visible, :default => true

      t.integer :organisation_id, :null => false

      t.timestamps
    end

    add_index :items, :organisation_id
    add_index :items, :unit_id
    add_index :items, :code
    add_index :items, :ctype
  end

  def self.down
    drop_table :items
  end
end
