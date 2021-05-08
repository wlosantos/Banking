FactoryBot.define do
  factory :order do
    type_order { :deposito }
    value { 0.0 }
    fee { 0.0 }
    status { :ativo }
    account
  end
end
