require 'rails_helper'

describe "company page" do
  it "can add a contact" do
    company = Company.create(name: "ESPN")

    visit company_path(company)

    fill_in :contact_full_name, with: 'Jeff Coffin'
    fill_in :contact_position, with: 'Music Tech'
    fill_in :contact_email, with: 'jcoffin@gmail.com'
    click_on 'Create Contact'

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content('Jeff Coffin')
    expect(page).to have_content('Music Tech')
    expect(page).to have_content('jcoffin@gmail.com')
  end

end
