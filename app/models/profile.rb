class Profile < ApplicationRecord
  belongs_to :user
  after_initialize :init

  def init
    self.plan_type ||= 'basic' 
  end

  def subscribe
    self.update(plan_type: 'pro')
    if self.plan_expiration
      self.update(plan_expiration: self.plan_expiration + 1.month )
    else
      self.update(plan_expiration: Time.now + 1.month )
    end
  end
end
