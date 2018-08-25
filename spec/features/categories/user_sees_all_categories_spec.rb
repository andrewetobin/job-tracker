require 'rails_helper'

describe "User sees all categories" do
  xscenario "a user sees all the categories" do
    category = Category.create!(title: "Development")
    category_two = Category.create!(title: "Finance")

    visit categories_path

    expect(page).to have_content("Development")
  end

end
