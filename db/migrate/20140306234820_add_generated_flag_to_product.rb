class AddGeneratedFlagToProduct < ActiveRecord::Migration
  def change
    add_column :products, :generated, :boolean
  end
end
