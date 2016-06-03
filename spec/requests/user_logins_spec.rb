require 'rails_helper'

RSpec.describe "UserLogins", type: :request do
  describe "registered user can login" do
    user = User.create(username: "Taco", password: "Taco")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "Taco"
    click_button "Login"

    assert page.has_content?("Welcome, Taco")
  end
end
