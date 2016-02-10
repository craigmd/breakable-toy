require 'rails_helper'

feature "Matchups index:" do
  before do
    visit matchups_path
  end

  scenario "user sees" do
    within("table.matchups-main-table") do
      expect(page).to have_content("Cam Newton")
      expect(page).to have_content("7500")
    end
  end

  scenario "user navigates back to welcome" do
    click_link "FFGutCheck"
    expect(current_path).to eq(root_path)
  end

  scenario "user navigates to player show page" do
    click_link "Cam Newton"
    expect(current_path).to eq(player_path(id: 1))
  end
end
