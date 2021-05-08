class Bank < ApplicationRecord

  enum status: %i[ ativo inativo ]
  validates :name, presence: true
  validates :cod_bank, presence: true

  def full_bank_name
    "#{cod_bank}-#{name}"
  end

end
