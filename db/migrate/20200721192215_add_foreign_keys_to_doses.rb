class AddForeignKeysToDoses < ActiveRecord::Migration[6.0]
  def change
    # adding columns
    add_column :doses, :cocktail_id, :integer
    add_column :doses, :ingredient_id, :integer

    # adding foreign keys
    add_foreign_key :doses, :cocktails
    add_foreign_key :doses, :ingredients
  end
end
