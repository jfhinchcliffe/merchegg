class Box < ApplicationRecord
  belongs_to :user
  validates_presence_of :title
  has_many :items
end
