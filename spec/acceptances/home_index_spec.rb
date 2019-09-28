require 'rails_helper'

describe "Home index", type: :feature do
  let(:first_race) { create(:race, date: Time.now) }
  let(:second_race) { create(:race, date: Time.now + 1.hour) }
  let(:third_race) { create(:race, date: Time.now + 2.hours) }
  let(:first_user) { create(:user) }
  let(:second_user) { create(:user) }

  before do
    Result.delete_all
    Race.delete_all
    User.delete_all

    create(:result, user_id: first_user.id, race_id: first_race.id)
    create(:result, user_id: first_user.id, race_id: second_race.id)
    create(:result, user_id: second_user.id, race_id: third_race.id)
  end

  context "when user is connected" do
    before do
      login_as(first_user)
    end

    it "Home index contains the two races from first user ordered by date DESC" do
      visit(root_path)

      expect(page).to have_text(first_race.name)
      expect(page).to have_text(second_race.name)
      expect(page).not_to have_text(third_race.name)
    end
  end
end