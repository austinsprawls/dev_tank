class Investment < ActiveRecord::Base
  belongs_to :lender
  belongs_to :loan
end
