require 'rails_helper'

RSpec.describe Race, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:distance) }

  it { is_expected.to validate_uniqueness_of(:name) }
end
