class Code < ApplicationRecord
  belongs_to :box
  scope :used, -> { where(expired: true) }
end
