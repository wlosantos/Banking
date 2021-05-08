FactoryBot.define do
  factory :account do
    email { Faker::Internet.email }
    password { '123456' }
    password_confirmation { '123456' }
    name { Faker::Name.name }
    document { '460.654.987-52' }
    agency { '2321' }
    num_account { 85473 }
    value { 0.0 }
    status { :ativo }
    bank 
  end
end
