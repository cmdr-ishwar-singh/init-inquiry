module InitInquiry
  class Inquiry < ApplicationRecord
  	validates :name,presence: true
  end
end
