class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :item_download_path, :item_download_path_id
  end
end
