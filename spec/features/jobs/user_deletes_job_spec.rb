require "rails_helper"

describe "user deletes an job" do
  describe "they link from the job show page" do
    it "displays all jobs without the deleted entry" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: 'Development')
      job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id)

      visit job_path(job_1)
      click_link "Delete"

      expect(current_path).to eq(jobs_path)
      expect(page).to have_content(job_2.title)
      expect(page).to_not have_content(job_1.title)
    end
  end
end
