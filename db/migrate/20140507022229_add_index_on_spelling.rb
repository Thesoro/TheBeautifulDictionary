class AddIndexOnSpelling < ActiveRecord::Migration
  def change
    add_index :words, :spelling
  end
end
