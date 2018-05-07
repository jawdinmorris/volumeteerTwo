class AddLimitCapToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :volunteer_cap, :integer
    add_column :users, :job_cap, :integer
  end
end
