class Investment < ActiveRecord::Base
  belongs_to :lender
  belongs_to :loan
  self.per_page = 20
end
