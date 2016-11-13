class Profile < ApplicationRecord
  belongs_to :user
  after_initialize :init

  def init
    self.plan_type ||= 'basic'
  end  
end
