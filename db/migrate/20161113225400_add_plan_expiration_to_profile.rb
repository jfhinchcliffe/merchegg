class AddPlanExpirationToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :plan_expiration, :datetime
  end
end
