require 'rails_helper'

describe 'user visits /jobs' do
  xit 'user sees all jobs in specific city' do
    company = Company.create!(name: 'Colorado Rockies')
    category = Category.create!(title: 'sports')
    job_1 = company.jobs.create!(title: 'Developer', level_of_interest: 74, city: 'Denver', category_id: category.id)
    job_2 = company.jobs.create!(title: 'Progammer', level_of_interest: 71, city: 'Denver', category_id: category.id)
    job_3 = company.jobs.create!(title: 'Radio Commentator', level_of_interest: 72, city: 'New York City', category_id: category.id)
    job_4 = company.jobs.create!(title: 'Beer Guy', level_of_interest: 73, city: 'Chicago', category_id: category.id)

    visit jobs_path(location: 'Denver')

    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_1.level_of_interest)
    expect(page).to have_content(job_1.city)
    expect(page).to have_content(job_2.title)
    expect(page).to have_content(job_2.level_of_interest)
    expect(page).to have_content(job_2.city)
    expect(page).to_not have_content(job_3.title)
    expect(page).to_not have_content(job_4.title)
  end

end