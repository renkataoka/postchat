class AddThumbToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :thumb, :string
  end
end
