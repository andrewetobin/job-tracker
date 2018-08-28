require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
    it "has many contacts" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:contacts)
    end
  end

  describe 'class methods' do
    before(:each) do
      category_1 = Category.create(title: 'Engineer')
      category_2 = Category.create(title: 'Devolpment')
      @company_1 = Company.create(name: "Turing")
      @company_2 = Company.create(name: "Whitewave")
      @company_3 = Company.create(name: "SoftyInc.")
      @company_4 = Company.create(name: "ERS")
      @job_1 = @company_1.jobs.create(title: "Developer", level_of_interest: 50, city: "Denver", category_id: category_1.id)
      @job_2 = @company_1.jobs.create(title: "QA", level_of_interest: 50, city: "San Fransisco", category_id: category_2.id)
      @job_3 = @company_4.jobs.create(title: "QA", level_of_interest: 40, city: "San Fransisco", category_id: category_2.id)
      @job_4 = @company_2.jobs.create(title: "Dev Ops", level_of_interest: 40, city: "Denver", category_id: category_2.id)
      @job_5 = @company_2.jobs.create(title: "Research", level_of_interest: 30, city: "New York", category_id: category_1.id)
      @job_6 = @company_3.jobs.create(title: "Research", level_of_interest: 10, city: "Denver", category_id: category_1.id)
      @job_7 = @company_3.jobs.create(title: "Research", level_of_interest: 10, city: "Denver", category_id: category_1.id)
      @job_8 = @company_3.jobs.create(title: "QA", level_of_interest: 30, city: "Denver", category_id: category_1.id)
      @job_9 = @company_4.jobs.create(title: "Developer", level_of_interest: 40, city: "Denver", category_id: category_1.id)
    end
    describe 'top_three_by_average_level_of_interest method' do
      it 'should have top three companies ranked by average level of interest ' do

        expect(Company.top_three_by_average_level_of_interest).to eq({"Turing"=>50, "ERS"=>40, "Whitewave"=>35})
      end
    end
  end
end
