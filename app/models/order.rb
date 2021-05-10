class Order < ApplicationRecord

  belongs_to :account
  belongs_to :favored, optional: true, foreign_key: :favored_by, class_name: 'Account'

  validates :type_order, presence: true
  validates :value, presence: true
  validates :fee, presence: true

  enum status: %i[ ativo inativo ]
  enum type_order: %i[ deposito saque transferencia ]

  scope :bank_statement, ->(account_holder) { where("created_at <= ? AND created_at >= ?", DateTime.now, DateTime.now - 10)
                                                                    .where("account_id = ? OR favored_id = ?", account_holder, account_holder)}

  after_create :balance_transation

  def quality_amount(conta)
    if self.type_order != 'deposito' && self.account.id == conta.id
      "- #{self.value}"
    else
      "#{self.value}"
    end
  end

  def favored_name(conta)
  if conta.id != self.favored_id
    Account.find_by_id(self.favored_id).name
  else
    account.name
  end
end

  def saida_amount?(conta)
    self.type_order != 'deposito' && self.account.id == conta.id
  end

  def setting_fee
    ted_amount - self.value
  end

  def balance_ted?
    account.balance >= ted_amount
  end


  def saque_permited?
    account.balance >= self.value
  end

  private

  def balance_transation
    if self.type_order == 'transferencia'
      confirm_ted
    elsif self.type_order == 'saque'
      account.update(value: account.value -= self.value)
    else
      account.update(value: account.value += self.value)
    end
  end

  def confirm_ted
    saldo = account.balance - ted_amount
    cliente = Account.find_by_id(self.favored_id)
    account.update(value: saldo)
    cliente.update(value: cliente.value += self.value)
  end

  def ted_amount
    amount = '5.0'.to_d
    amount = '7.0'.to_d if set_fee?
    amount += '10.0'.to_d unless ted_limit_without_fee?
    amount += self.value
  end

  def weekend?
    Time.now.wday == 0 || Time.now.wday == 6
  end

  def hour_comercial?
    Time.now.hour < 8 || Time.now.hour > 18
  end

  def set_fee?
    weekend? || hour_comercial?
  end

  def ted_limit_without_fee?
    self.value <= '1000.0'.to_d
  end

end
