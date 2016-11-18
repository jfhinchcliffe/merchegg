class Box < ApplicationRecord
  belongs_to :user
  validates_presence_of :title
  has_many :items
  has_many :codes
  # after_save populate_codes
  after_save :populate_codes

  def populate_codes
    if self.user.profile.plan_type == 'pro'
      10.times do
        create_a_code(self)
      end
    else
      20.times do
        create_a_code(self)
      end
    end  
  end

  def access?(user)
    UserCodedBox.exists?(user_id: user.id, box_id: self.id) || self.user_id == user.id
  end

end
