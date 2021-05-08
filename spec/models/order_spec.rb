require 'rails_helper'

RSpec.describe Order, type: :model do

  describe 'check all required fields' do
    it { is_expected.to respond_to :type_order }
    it { is_expected.to respond_to :value }
    it { is_expected.to respond_to :fee }
    it { is_expected.to respond_to :status }
    it { is_expected.to respond_to :account_id }
    it { is_expected.to respond_to :favored_id }
  end

  describe 'check all associations for order' do
    it { is_expected.to belong_to :account }
  end

  describe 'check all validates fields' do
    it { should define_enum_for(:status).with_values(%i[ ativo inativo ])}
    it { should define_enum_for(:type_order).with_values(%i[ deposito saque transferencia ])}
  end

  it 'has a valid factory Order' do
    expect(create(:order)).to be_valid
  end

end
