class CreateCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :codes do |t|
      t.references :box, foreign_key: true
      t.string :code
      t.boolean :expired, default: true

      t.timestamps
    end
  end
end
