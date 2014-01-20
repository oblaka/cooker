class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.float :quantity
      t.string :unit
      t.boolean :correct

      t.timestamps
    end
  end
end
