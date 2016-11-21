class Profile < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user
  after_initialize :init
  validates_uniqueness_of :account_name
  validates :account_name,  presence: true, format: { with: /\A[a-z\d]*\Z/i, message: "only allows letters and numbers" }, length: { in: 6..20 }
  validates :about, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }
  validates :picture,  presence: true

  def init
    self.plan_type ||= 'basic' 
    self.text_count ||= 0
  end

  def can_text?
    if self.plan_type == 'basic' && self.text_count >= 5
      return false
    elsif self.plan_type == 'pro' && self.text_count >= 10
      return false
    else
      return true
    end    
  end  

  def self.search(pattern)
    where('account_name LIKE ?', "%#{pattern}%")
  end

  def add_text_count
    self.text_count += 1
    self.save
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
