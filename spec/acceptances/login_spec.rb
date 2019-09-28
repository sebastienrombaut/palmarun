require 'rails_helper'

describe "Login", type: :feature do
  let(:user) { create(:user) }

  context "with valid credentials" do
    let(:password) { 'foobar' }

    it "works" do
      visit new_user_session_path

      within("#new_user") do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: password
        click_button
      end

      expect(page).to have_text(user.first_name)
    end
  end
end