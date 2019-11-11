require 'rails_helper'

RSpec.describe Result, type: :model do
  it { is_expected.to validate_presence_of(:race_id) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:running_time) }
  it { is_expected.to validate_presence_of(:date) }

  it { is_expected.to validate_uniqueness_of(:date) }
end
