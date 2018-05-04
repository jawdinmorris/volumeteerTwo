class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :description
      t.string :street
      t.string :city
      t.string :country
      t.integer :postcode
      t.string :skills_needed
      t.integer :volunteers_needed
      t.timestamps
    end
    add_reference :jobs, :user, index: true
  end
end
