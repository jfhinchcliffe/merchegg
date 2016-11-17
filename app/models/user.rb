class User < ApplicationRecord
  has_one :profile
  has_many :payments
  has_many :boxes
  has_many :user_coded_boxes
  #after_create :create_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def filled_in_account_name?
    self.profile.account_name != nil
  end

  private

  def create_profile
    Profile.create(user_id: self.id) 
  end
end
