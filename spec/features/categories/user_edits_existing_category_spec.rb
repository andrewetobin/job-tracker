require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Development")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit edit_category_path(category)

    fill_in "category[title]", with: "Specialist"
    click_button "Update"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Specialist")
    expect(page).to_not have_content("Development")
  end
end
