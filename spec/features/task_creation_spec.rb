require 'rails_helper'

RSpec.feature "Creating a task" do
  context "from an existing project" do
    before do
      @project = Project.create(name: "Test project")
    end

    it "succeeds with valid input" do
      visit project_path(@project)
      click_link_or_button("Add Task")
      fill_in "Name", with: "Task name"
      click_link_or_button "Create Task"

      expect(page).to have_content("Task Created")
      expect(page).to have_content("Task name")
    end
  end
end