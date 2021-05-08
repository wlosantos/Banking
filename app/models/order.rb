class Order < ApplicationRecord

  belongs_to :account
  belongs_to :favored, optional: true, foreign_key: :favored_by, class_name: 'Account'

  validates :type_order, presence: true
  validates :value, presence: true
  validates :fee, presence: true

  enum status: %i[ ativo inativo ]
  enum type_order: %i[ deposito saque transferencia ]

end
