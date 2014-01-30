class AddLanguagesToFunction < ActiveRecord::Migration
  def change
    add_column :functions, :languages, :string
  end
end
