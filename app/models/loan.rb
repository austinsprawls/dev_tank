class Loan < ActiveRecord::Base
  belongs_to :lendee
  has_many :investments
  has_many :lenders, through: :investments

  validates :lendee_id, :amount, :expiration_date, :rate, :term, presence: true
  validate :expiration_date_cannot_be_in_the_past

  def expiration_date_cannot_be_in_the_past
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end
end
