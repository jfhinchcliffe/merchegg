class CreateUserCodedBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_coded_boxes do |t|
      t.references :user, foreign_key: true
      t.references :box, foreign_key: true

      t.timestamps
    end
  end
end
