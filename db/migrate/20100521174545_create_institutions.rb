require 'gbarcode'

class CreateInstitutions < ActiveRecord::Migration
  def self.up
    create_table :institutions do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.integer :symbology, :null => false, :default => Gbarcode::BARCODE_39
      t.boolean :checksum, :null => false, :default => true
    end
  end

  def self.down
    drop_table :institutions
  end
end
