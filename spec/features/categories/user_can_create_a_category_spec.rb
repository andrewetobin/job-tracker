require 'rails_helper'

describe 'user can create a new category' do
  it 'can create create a new category' do
    visit new_category_path

    fill_in "category[title]", with: "Construction"

    click_button "Create Category"

    expect(current_path).to eq(categories_path(Category.last))
    expect(page).to have_content("Construction")
  end
  it "user is sent back to create page if category already exists" do
    category = Category.create(title: "Construction")

    visit new_category_path
    fill_in "category[title]", with:"Construction"

    click_button "Create Category"

    # expect(current_path).to eq(new_category_path)
    expect(page).to have_content("Sorry, that category name already exists!")
  end


end
