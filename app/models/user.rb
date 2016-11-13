class User < ApplicationRecord
  has_one :profile
  after_create :create_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def filled_in_account_name?
    self.profile.account_name != nil
  end         
end
