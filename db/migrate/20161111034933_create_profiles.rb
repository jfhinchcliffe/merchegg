class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :account_name
      t.string :plan_type
      t.text :about

      t.timestamps
    end
  end
end
