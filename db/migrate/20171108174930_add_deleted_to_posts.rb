class AddDeletedToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :deleted, :boolean, null: false, default: false
  end
end
