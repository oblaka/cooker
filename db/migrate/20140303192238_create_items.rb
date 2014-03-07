class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :user, index: true
      t.references :product, index: true
      t.float :quantity

      t.timestamps
    end
  end
end
