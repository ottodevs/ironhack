class CreateSandwichIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :sandwich_ingredients do |t|
      t.belongs_to :sandwich, index: true
      t.belongs_to :ingredient, index: true

      t.timestamps
    end
  end
end
