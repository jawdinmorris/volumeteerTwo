class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :business_name
      t.string :bio
      t.integer :phone
      t.string :street
      t.string :city
      t.string :country
      t.integer :postcode
      t.timestamps
    end
  end
end
