require 'rails_helper'

RSpec.describe "UserLogouts", type: :request do
  describe "GET /user_logouts" do
    it "works! (now write some real specs)" do
      get user_logouts_path
      expect(response).to have_http_status(200)
    end
  end
end
