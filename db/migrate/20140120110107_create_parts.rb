class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.float :quantity
      t.references :recipe, index: true
      t.references :product, index: true
      t.boolean :positive

      t.timestamps
    end
  end
end
