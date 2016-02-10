require 'rails_helper'

feature "Welcome page:" do
  before do
    visit root_path
  end

  scenario "user sees" do
    expect(page).to have_content("YOUR DFF RESEARCH STATION")
  end

  scenario "user naviagates to matchups" do
    click_link "Research"
    expect(current_path).to eq(matchups_path)
  end
end
