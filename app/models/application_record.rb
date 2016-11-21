class ApplicationRecord < ActiveRecord::Base
  require 'securerandom'
  self.abstract_class = true

  def create_a_code(box)
    code = SecureRandom.hex(4)
    box.codes.create(code: code, expired: false, sent_via_message: false)
  end

end
