class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :bank
  has_many :orders

  enum status: %i[ ativo inativo ]

  validates_presence_of :name
  validates_presence_of :document
  validates_presence_of :agency

  before_validation :generate_bank_account

  def balance
    self.value
  end

  protected
  # Gerenado uma conta bancária para o usuário
  def generate_bank_account
    if self.bank_id.nil? || self.bank_id.blank?
      begin
        banco = Bank.all.sample
        self.bank_id = banco.id != nil ? banco.id : 1
        self.agency = rand(100..999).to_s
        self.num_account = rand(1000..9999)
      end while Account.exists?(agency) && Account.exists?(num_account)
    end
  end

end
