class Lendees::RegistrationsController < Devise::RegistrationsController


  private

  def sign_up_params
    params.require(:lendee).permit(:email, :password,:first_name, :last_name, :street_address,
                                    :city, :state, :zip_code, :date_of_birth, :yearly_individual_income, :credit_range)
  end
end
