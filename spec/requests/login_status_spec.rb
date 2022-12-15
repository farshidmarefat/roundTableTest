require 'rails_helper'

RSpec.describe 'Login requests' do
  describe 'POST /login' do
    it 'returns a login status message' do
      get('/login')
      expect(response).to have_http_status(200)
    end
  end
end