class AddNameToCocktails < ActiveRecord::Migration[5.0]
  def change
    add_column :cocktails, :name, :string
  end
end
