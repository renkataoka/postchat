class AddBiogToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :biog, :text
  end
end
