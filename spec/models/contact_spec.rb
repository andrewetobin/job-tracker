require 'rails_helper'

describe Contact do
 describe "validations" do
   context "invalid attributes" do
     it "is invalid without a full_name" do
       company = Company.create(name: "Turing")

       contact = Contact.new(position: "Recruiter", email: "abc@gmail.com", company_id: company.id)

       expect(contact).to be_invalid
     end
     it "is invalid without a postion" do
       company = Company.create(name: "Turing")

       contact = Contact.new(full_name: "Joseph Davis", email: "abc@gmail.com", company_id: company.id)

       expect(contact).to be_invalid
     end
     it "is invalid without an email" do
       company = Company.create(name: "Turing")

       contact = Contact.new(full_name: "Joseph Davis", position: "Recruiter", company_id: company.id)

       expect(contact).to be_invalid
     end
     it "is invalid without a company" do
       company = Company.create(name: "Turing")

       contact = Contact.new(full_name: "Joseph Davis", position: "Recruiter", email: "abc@gmail.com")

       expect(contact).to be_invalid
     end
     it "is valid with attributes" do
       company = Company.create(name: "Turing")

       contact = company.contacts.create(full_name: "Joseph Davis", position: "Recruiter", email: "abc@gmail.com")

       expect(contact).to be_valid
     end
   end
   describe "relationships" do
     it "belongs to a company" do
       contact = Contact.new(full_name: "Joseph Davis", position: "Recruiter", email: "abc@gmail.com")

       expect(contact).to respond_to(:company)
     end
   end
 end
end
