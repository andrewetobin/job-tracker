require 'rails_helper'

describe 'user can create a new category' do
  it 'can create create a new category' do
    visit new_category_path

    fill_in "category[title]", with: "Construction"

    click_button "Create Category"

    expect(current_path).to eq(categories_path(Category.last))
    expect(page).to have_content("Construction")
  end


end
