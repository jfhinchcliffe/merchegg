class ChangeItemColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :item_download_path_id, :download_path
  end
end
