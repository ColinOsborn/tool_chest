require 'rails_helper'

RSpec.feature "Tool management", type: :feature do
  # it refers to a unit level
  scenario "user creates a new tool" do
    # visit a page with the form to create a new tool
    visit new_tool_path
    # fill in the tools attributes, name, price and quantity
    fill_in "Name", with: "Screwdriver"
    fill_in "tool[price]", with: 10.99
    fill_in "tool[quantity]", with: 10
    # submit that form
    find(:button, "Create Tool").click
    # click_button "Create Tool" -- This syntax is on it's way out, can be ambigeous
    # check and see that I'm on the tool show page
    expect(current_path).to eq( tool_path(Tool.last.id) )
    # check and make sure all the attributes I filled in and submitted are displaying on the page
    # can scope this down as specific as you'd ever want
    # can certaintly scope down to find images, and also nested divs and imgs
    #ul li:nth-child(3)
    within(".tool_info li:nth-child(1)") do
      expect(page).to have_content("Screwdriver")
    end

    within("tool_info li:nth-child(2)") do
      expect(page).to have_content("10.99")
    end

    within("tool_info li:nth-child(3)") do
      expect(page).to have_content("InStock: 10")
    end
  end
end
