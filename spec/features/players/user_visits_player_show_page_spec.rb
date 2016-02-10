require 'rails_helper'

feature "Player show page:" do
  before do
    visit player_path(id: 1)
  end

  scenario "user sees" do
    expect(page).to have_content("Game Logs")
  end

  scenario "user navigates back to welcome" do
    click_link "FFGutCheck"
    expect(current_path).to eq(root_path)
  end
end
