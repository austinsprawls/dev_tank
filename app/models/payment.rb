class Payment < ActiveRecord::Base
  belongs_to :lendee
  belongs_to :lender
  validates :amount, :lender_id, :lendee_id, presence: true
end
