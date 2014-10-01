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

  it { should be_valid}

  describe "when email is not present" do
    before { @lender.email = " "}
    it { should_not be_valid}
  end

  describe "when password is not present" do
     before { @lender.password = " "}
     it { should_not be_valid}
  end

  describe "when state of residence is not present" do
    before { @lender.state_of_residence = " "}
    it { should_not be_valid}
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @lender.email = valid_address
        expect(@lender).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      lender_with_same_email = @lender.dup
      lender_with_same_email.save
    end

    it { should_not be_valid }
  end

end
