class AddSentViaMessageToCodes < ActiveRecord::Migration[5.0]
  def change
    add_column :codes, :sent_via_message, :boolean
  end
end
