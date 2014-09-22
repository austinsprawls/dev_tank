class Loan < ActiveRecord::Base
  belongs_to :lendee
  has_many :investments
  has_many :lenders, through: :investments

  validates :lendee_id, :amount, :expiration_date, :rate, :term, presence: true
  validate :expiration_date_cannot_be_in_the_past

  self.per_page = 15

  def expiration_date_cannot_be_in_the_past
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end

  filterrific(
    default_settings: { sorted_by: 'created_at_desc' },
    filter_names: [
      :sorted_by,
      :search_query,
      :rate,
      :term
    ]
  )

  def self.options_for_term_select
    order(:term).map {|loan| loan.term}.uniq
  end

  def self.options_for_rate_select
    order(:rate).map {|loan| loan.rate}.uniq
  end

  scope :sorted_by, lambda { |sort_key|}
  scope :search_query, lambda { |query|
    # Filters students whose name or email matches the query
  }
  scope :rate, lambda { |rates| where(rate: [*rates])}
  scope :term, lambda {|terms| where(term: [*terms])}
end
