require_relative '../rails_helper'
require_relative '../spec_helper'

describe Lendee do
  before { @lendee = Lendee.new(first_name: 'Austin',
                                last_name: 'Sprawls',
                                email: 'asprawls@gmail.com',
                                password: 'as759323',
                                street_address: '123 somewhere lane',
                                city: 'Austin',
                                state: 'TX',
                                zip_code: '76841',
                                date_of_birth: Date.parse('Dec 25 1991'),
                                yearly_individual_income: 42000,
                                credit_range: '660-720') }

  subject { @lendee }

  it { should respond_to(:first_name) }
  it { should respond_to(:email) }
  it { should respond_to(:last_name)}
  it { should respond_to(:password)}
  it { should respond_to(:street_address)}
  it { should respond_to(:city)}
  it { should respond_to(:state)}
  it { should respond_to(:zip_code)}
  it { should respond_to(:date_of_birth)}
  it { should respond_to(:yearly_individual_income)}
  it { should respond_to(:credit_range)}

  it { should be_valid}

  describe "when name is not present" do
    before { @lendee.first_name = " "; @lendee.last_name = " " }
    it { should_not be_valid}
  end

  describe "when email is not present" do
    before { @lendee.email = " "}
    it { should_not be_valid}
  end

  describe "when password is not present" do
    before { @lendee.password = " "}
    it { should_not be_valid}
  end

  describe "when street address is not present" do
    before { @lendee.street_address = " "}
    it { should_not be_valid}
  end

  describe "when city is not present" do
    before { @lendee.city = " "}
    it { should_not be_valid}
  end

  describe "when state is not present" do
    before { @lendee.state = " "}
    it { should_not be_valid}
  end

  describe "when zip code is not present" do
    before { @lendee.zip_code = " "}
    it { should_not be_valid}
  end

  describe "when date of birth is not present" do
    before { @lendee.date_of_birth = " "}
    it { should_not be_valid}
  end

  describe "when yearly individual income is not present" do
    before { @lendee.yearly_individual_income = " "}
    it { should_not be_valid}
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @lendee.email = valid_address
        expect(@lendee).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      lendee_with_same_email = @lendee.dup
      lendee_with_same_email.save
    end

    it { should_not be_valid }
  end

end
