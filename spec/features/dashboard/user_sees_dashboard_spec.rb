require 'rails_helper'
describe "User visits dashboard" do
  before(:each) do
    category_1 = Category.create(title: 'Engineer')
    category_2 = Category.create(title: 'Devolpment')
    company_1 = Company.create(name: "Turing")
    company_2 = Company.create(name: "Whitewave")
    @job_1 = company_1.jobs.create(title: "Developer", level_of_interest: 40, city: "Denver", category_id: category_1.id)
    @job_2 = company_1.jobs.create(title: "QA", level_of_interest: 50, city: "San Fransisco", category_id: category_2.id)
    @job_3 = company_1.jobs.create(title: "Research", level_of_interest: 10, city: "San Fransisco", category_id: category_2.id)
    @job_4 = company_2.jobs.create(title: "Dev Ops", level_of_interest: 40, city: "Denver", category_id: category_2.id)
    @job_5 = company_2.jobs.create(title: "Research", level_of_interest: 30, city: "New York", category_id: category_1.id)
    @job_6 = company_2.jobs.create(title: "QA", level_of_interest: 50, city: "Denver", category_id: category_1.id)
  end
  it 'should see a dashboard' do

    visit '/dashboard'

    expect(page).to have_content("Job Tracker")
  end
  it 'should see count by level of interest' do
    count = Job.count_by_level_of_interest[@job_1.level_of_interest]

    visit '/dashboard'

    expect(page).to have_content("Jobs By Interest")
    expect(page).to have_content("#{@job_1.level_of_interest} has #{count}")
  end
  it 'should see count by level of interest' do
    count = Job.count_by_location[@job_1.city]

    visit '/dashboard'
    
    expect(page).to have_content("#{@job_1.city} Jobs")
    expect(page).to have_content("#{count} Jobs")
    expect(page).to have_link(@job_1.city)
  end
end
