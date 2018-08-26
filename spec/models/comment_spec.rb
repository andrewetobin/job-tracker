require 'rails_helper'

describe Comment do
 describe "validations" do
   context "invalid attributes" do
     it "is invalid without a body" do
       category = Category.create(title: 'Development')
       company = Company.create(name: "Turing")
       job = Job.create(title: "Developer", level_of_interest: 40, city: "Denver", category_id: category.id, company_id: company.id)

       comment = Comment.new(job_id: job.id)

       expect(comment).to be_invalid
     end
     context "valid attributes" do
       it "is valid with a body" do
         category = Category.create(title: 'Development')
         company = Company.create(name: "Turing")
         job = Job.create(title: "Developer", level_of_interest: 40, city: "Denver", category_id: category.id, company_id: company.id)

         comment = Comment.new(body: "Hello World!", job_id: job.id)

         expect(comment).to be_valid
       end
     end
   end

   describe "relationships" do
     it "belongs to a job" do
       comment = Comment.new(body: "Hello World!")

       expect(comment).to respond_to(:job)
     end
   end
 end
end
