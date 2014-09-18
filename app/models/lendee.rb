class Lendee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :loan

  validates :first_name, :last_name, :street_address, :city, :state, :zip_code,
            :date_of_birth, :yearly_individual_income, :credit_range, presence: true
end
