require 'rails_helper'


describe "user visits job show page" do
  it 'should have a comments form' do
    category = Category.create(title: 'Development')
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit job_path(job)

    expect(page).to have_content("Notes:")
  end
  context 'user fills and submits comments form' do
    it "displays the comment on the job show" do
      category = Category.create(title: 'Development')
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

      visit job_path(job)

      fill_in "comment[body]", with: "So many thoughts on this job."
      click_on "Create"

      expect(current_path).to eq(job_path(job))
      expect(page).to have_content("So many thoughts on this job.")
    end
  end
end
