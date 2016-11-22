class AddTwitterAndFacebookToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :twitter, :string
    add_column :profiles, :facebook, :string
  end
end
