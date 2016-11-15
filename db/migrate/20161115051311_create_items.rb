class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :box, foreign_key: true
      t.string :name
      t.string :item_download_path

      t.timestamps
    end
  end
end
