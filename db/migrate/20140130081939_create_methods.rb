class CreateMethods < ActiveRecord::Migration
  def change
    create_table :methods do |t|
      t.string :name
      t.text :data
      t.text :description
      t.string :argument
      t.string :return_value
      t.text :tag

      t.timestamps
    end
  end
end
