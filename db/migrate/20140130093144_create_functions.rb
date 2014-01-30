class CreateFunctions < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.string :names
      t.text :data
      t.text :descriptions
      t.string :arguments
      t.string :return_values
      t.text :tags

      t.timestamps
    end
  end
end
