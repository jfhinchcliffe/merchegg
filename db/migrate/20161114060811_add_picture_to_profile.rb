class AddPictureToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :picture, :string
  end
end
