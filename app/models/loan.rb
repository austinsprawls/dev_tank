class Loan < ActiveRecord::Base
  belongs_to :lendee
  has_many :investments
  has_many :lenders, through: :investments
end
