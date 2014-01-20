class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :quantity
      t.string :unit

      t.timestamps
    end
  end
end
