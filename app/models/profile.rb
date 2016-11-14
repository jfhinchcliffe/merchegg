class Profile < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user
  after_initialize :init
  validates_uniqueness_of :account_name
  validates :account_name,  presence: true, format: { with: /\A[a-z\d]*\Z/i, message: "only allows letters and numbers" }, length: { in: 6..20 }
  validates :about, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }

  def init
    self.plan_type ||= 'basic' 
  end

  def self.search(pattern)
    where('account_name LIKE ?', "%#{pattern}%")
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
