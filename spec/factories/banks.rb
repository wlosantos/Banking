FactoryBot.define do
  factory :bank do
    name { Faker::Bank.name }
    cod_bank { rand(100..300).to_s }
    status { :ativo }
  end
end
