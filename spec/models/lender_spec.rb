require_relative '../rails_helper'
require_relative '../spec_helper'

describe Lender do
  before { @lender = Lender.new(email: 'dcox@gmail.com',
                                password: 'dc9082102',
                                state_of_residence: 'TX')}

  subject { @lender }

  it { should respond_to(:email)}
  it { should respond_to(:password)}
  it { should respond_to(:state_of_residence)}
end
