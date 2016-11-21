class AddTextCountToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :text_count, :integer
  end
end
