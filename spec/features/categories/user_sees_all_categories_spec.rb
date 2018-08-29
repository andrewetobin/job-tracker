require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Development")
    category_two = Category.create!(title: "QA")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category_two.id)

    visit categories_path

    expect(page).to have_content("Job Categories")
    expect(page).to have_content("Development")
    expect(page).to have_content("QA")
  end
end
