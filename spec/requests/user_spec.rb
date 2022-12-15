require 'rails_helper'

RSpec.describe "CurrentUserController", :type =>  :request do
  describe "GET index" do
    it 'should works without authorization' do
      get('/current_user')
      expect(response).to have_http_status(200)
    end
  end
end