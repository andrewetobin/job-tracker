require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Development")
    job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 39, city: "New York City", category_id: category.id)

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Development Jobs")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("New York City")
    expect(page).to have_content("Interest: #{job_1.level_of_interest}")
  end
end
