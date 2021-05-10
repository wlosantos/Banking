require 'rails_helper'

RSpec.describe 'Sessions' do

  describe 'sign in account' do
    before do
      sign_in create(:account)
      get root_path
    end

    it 'params valid' do
      expect(response).to be_successful
    end
    it 'returns status code' do
      expect(response.status).to eql 200
    end
  end

end
