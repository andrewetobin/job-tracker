require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    category = Category.create(title: 'Development')
    company = Company.create(name: "ESPN")
    company_2 = Company.create(name: "Turing")

    visit new_job_path

    fill_in "job[title]", with: "Developer"
    select 'Development', from: "Category"
    select 'Turing', from: "Company"

    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"

    click_button "Create Job"

    expect(current_path).to eq(job_path(Job.last))
    expect(page).to have_content("Turing")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
