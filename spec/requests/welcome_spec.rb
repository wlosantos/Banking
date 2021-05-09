require 'rails_helper'

RSpec.describe "Welcomes", type: :request do

  describe 'GET /index' do
    let!(:account) { create(:account) }
    before do
      sign_in account
      get root_path
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'returns status code 200' do
      expect(response.status).to eql(200)
    end

    it 'return the content' do
      expect(response.body).to include('nobe-Bank')
    end
  end

  describe 'GET /deposito' do
    before do
      sign_in create(:account)
      get deposito_path
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'returns status code 200' do
      expect(response.status).to eql(200)
    end

    it 'return the content' do
      expect(response.body).to include('Depósito')
    end
  end

end
