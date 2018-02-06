require 'rails_helper'

RSpec.feature "Creating a project" do
  it "succeeds with valid input" do
    visit root_path
    click_link_or_button "New Project"

    fill_in "Name", with: "Project name"
    click_link_or_button "Create Project"

    expect(page).to have_content("Project Created")
    expect(page).to have_content("Project name")
  end

  pending "fails with invalid input"
end