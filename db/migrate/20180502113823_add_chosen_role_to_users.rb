class AddChosenRoleToUsers < ActiveRecord::Migration[5.1]
  def change
     add_column :users, :chosen_role, :string 
  end
end
