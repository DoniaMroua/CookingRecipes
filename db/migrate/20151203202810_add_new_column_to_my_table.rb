class AddNewColumnToMyTable < ActiveRecord::Migration
  def change 
  add_column :recipes, :rate, :integer
  end
end
