class AddEmailsToFunction < ActiveRecord::Migration
  def change
    add_column :functions, :emails, :string
  end
end
