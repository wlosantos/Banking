bancos = %w[ Bradesco Santander Itaú Nubank C6 BB Next ]

bancos.each do |banco|
  FactoryBot.create(:bank, name: banco, cod_bank: rand(100..400).to_s)
end
