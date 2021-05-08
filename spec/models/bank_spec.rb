require 'rails_helper'

RSpec.describe Bank, type: :model do
  describe 'check all required fields' do
    it { is_expected.to respond_to :name    }
    it { is_expected.to respond_to :cod_bank   }
    it { is_expected.to respond_to :status  }
  end

  describe 'check all validates fields' do
    it { is_expected.to validate_presence_of :name  }
    it { is_expected.to validate_presence_of :cod_bank }
    it { should define_enum_for(:status).with_values(%i[ ativo inativo ])}
  end

  describe 'check all associations for bank' do
    it { is_expected.to have_many :accounts }
  end

  describe 'valid factory banks' do
    it 'has a valid FactoryBot bank' do
      expect(build(:bank)).to be_valid
    end
  end

  describe '#full_bank_name' do
    let(:bank) { create(:bank) }
    it 'return name and cod_bank' do
      expect(bank.full_bank_name).to eq( "#{bank.cod_bank}-#{bank.name}" )
    end
  end
end
