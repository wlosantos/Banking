class Order < ApplicationRecord

  belongs_to :account

  validates :type_order, presence: true
  validates :value, presence: true
  validates :fee, presence: true

  enum status: %i[ ativo inativo ]
  enum type_order: %i[ deposito saque transferencia ]

end
