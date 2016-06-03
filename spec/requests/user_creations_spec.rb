require 'rails_helper'

RSpec.describe "UserCreations", type: :request do
  describe "a user can be created" do
    visit new_user_path
    fill_in "Username", with: "Colin"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome, Colin")
  end
end
