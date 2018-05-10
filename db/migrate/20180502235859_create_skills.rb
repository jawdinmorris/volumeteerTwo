class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills, &:timestamps
  end
end
