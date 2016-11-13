class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :description
      t.integer :amount
      t.string :stripe_payment_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
