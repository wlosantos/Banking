class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :bank

  enum status: %i[ ativo inativo ]

  validates_presence_of :name
  validates_presence_of :document
  validates_presence_of :agency

  before_validation :generate_bank_account

  protected
  # Gerenado uma conta bancária para o usuário
  def generate_bank_account
    if self.bank_id.nil?
      begin
        banco = Bank.all.sample
        self.bank_id = 1 unless banco
        self.agency = rand(100..999).to_s
        self.num_account = rand(1000..9999)
      end while Account.exists?(agency) && Account.exists?(num_account)
    end
  end

end
