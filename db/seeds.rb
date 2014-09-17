# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


dob = Date.parse('1991-12-25')

lendee = Lendee.create([
  {first_name: 'Austin',
  last_name: 'Sprawls',
  email: 'asprawls@gmail.com',
  password: 'as759323',
  street_address: '123 somewhere lane',
  city: 'Austin',
  state: 'TX',
  zip_code: '76841',
  date_of_birth: dob,
  yearly_individual_income: 42000,
  credit_range: '660-720',
  },
  {first_name: 'Justin',
  last_name: 'Lilly',
  email: 'jlilly@gmail.com',
  password: 'jl759323',
  street_address: '123 somewhere lane',
  city: 'Austin',
  state: 'TX',
  zip_code: '76841',
  date_of_birth: dob,
  yearly_individual_income: 12000,
  credit_range: '600-660',
  }
])

lenders = Lender.create([
    {email: 'dcox@gmail.com',
    password: 'dc9082102',}
])

expiration = Date.parse('2015-01-06')

loans = Loan.create([
  {lendee_id: lendee.first.id,
  amount: 7000,
  expiration_date: expiration
  },
  {lendee_id: lendee[1].id,
  amount: 10000,
  expiration_date: expiration
  }
])

investments = Investment.create([
  {lender_id: lenders.first.id,
  loan_id: loans.first.id,
  amount: 2000},
  {lender_id: lenders.first.id,
  loan_id: loans[1].id,
  amount: 5000}
])
