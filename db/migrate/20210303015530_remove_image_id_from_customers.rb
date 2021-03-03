class RemoveImageIdFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :image_id, :string
  end
end
