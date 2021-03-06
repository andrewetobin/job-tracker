require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.create(title: 'Development')
        company = Company.create(name: "Turing")
        job = Job.new(level_of_interest: 40, city: "Denver", category_id: category.id, company_id: company.id)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        category = Category.create(title: 'Development')
        company = Company.create(name: "Turing")
        job = Job.new(title: "Developer", city: "Denver", category_id: category.id, company_id: company.id)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        category = Category.create(title: 'Development')
        company = Company.create(name: "Turing")
        job = Job.new(title: "Developer", level_of_interest: 40, category_id: category.id, company_id: company.id)
        expect(job).to be_invalid
      end

      it "is invalid without a company" do
        category = Category.create(title: 'Development')
        company = Company.create(name: "Turing")
        job = Job.new(title: "Developer", description: "Wahoo", city: 'Denver', level_of_interest: 80, category_id: category.id)
        expect(job).to be_invalid
      end

      it "is invalid without a category" do
        category = Category.create(title: 'Development')
        company = Company.create(name: "Turing")
        job = Job.new(title: "Developer", description: "Wahoo", city: 'Denver', level_of_interest: 80, company_id: company.id)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, category, and company" do
        category = Category.create(title: 'Development')
        company = Company.create(name: "Turing")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", category_id: category.id, company_id: company.id)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
    it "belongs to a category" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:category)
    end
    it "has many comments" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:comments)
    end
  end

  describe 'class methods' do
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
    describe 'count_by_level_of_interest method' do
      it 'should have count of jobs by level_of_interest' do

        expect(Job.count_by_level_of_interest).to eq({50=>2, 40=>2, 30=>1, 10=>1})
      end
    end
    describe 'count_by_location method' do
      it 'should have count of jobs by location' do

        expect(Job.count_by_location).to eq({'Denver'=>3, 'San Fransisco'=>2, 'New York'=>1})
      end
    end
  end
end
