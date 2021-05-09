require 'rails_helper'

RSpec.describe "Welcomes", type: :request do

  describe 'GET /index' do
    before do
      sign_in create(:account)
      get root_path
    end

    it 'returns http success' do
      expect(response.status).to eq(200)
    end

    it 'return content' do
      expect(response.body).to include('nobe-Bank')
    end

  end

end
