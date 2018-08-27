require 'rails_helper'

describe "User edits an existing company" do
  scenario "a user can edit a company" do
    category = Category.create(title: 'Development')
    company = Company.create(name: "ESPN")
    company_2 = Company.create(name: "Turing")
    job_1 = company.jobs.create(title: 'QA', description: 'Its OK', level_of_interest: 20, city: 'LA', category_id: category.id)

    visit edit_job_path(job_1)

    fill_in "job[title]", with: "Developer"
    select 'Development', from: "Category"
    select 'ESPN', from: "Company"

    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"

    click_button "Update Job"

    expect(current_path).to eq(job_path(job_1))
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
