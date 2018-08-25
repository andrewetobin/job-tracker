require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Development")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id)

    visit category_path(category)

    expect(current_path).to eq("/category/#{category.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end
end
