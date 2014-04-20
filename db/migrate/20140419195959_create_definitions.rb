class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.references :word, index: true
      t.text :content
      t.string :part_of_speech

      t.timestamps
    end
  end
end
