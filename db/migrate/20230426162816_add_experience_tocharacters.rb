class AddExperienceTocharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters,:experience,:integer
  end
end
