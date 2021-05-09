require 'rails_helper'

RSpec.describe Account, type: :model do

  describe 'check all required fields' do
    it { is_expected.to respond_to :name     }
    it { is_expected.to respond_to :email    }
    it { is_expected.to respond_to :document }
    it { is_expected.to respond_to :agency   }
    it { is_expected.to respond_to :num_account  }
    it { is_expected.to respond_to :value    }
    it { is_expected.to respond_to :status   }
    it { is_expected.to respond_to :bank_id  }
  end

  describe 'check all validates fields' do
    it { is_expected.to validate_presence_of :name  }
    it { is_expected.to validate_presence_of :document }
    it { should define_enum_for(:status).with_values(%i[ ativo inativo ])}
  end

  describe 'check all associations for account' do
  it { is_expected.to belong_to :bank }
end

  describe 'valid factory account and #generate_bank_account' do
    it 'has a valid FactoryBot account' do
      expect(create(:account)).to be_valid
    end
  end

  describe '#balance' do
    let(:account) { create(:account, value: 50.0) }
    it 'check balance' do
      expect(account.balance).to eq(account.value)
    end
  end

end
