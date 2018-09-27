require 'rails_helper'

RSpec.describe User, type: :model do
  it 'include Timestamp concern' do
    expect(described_class).to include(Timestamp)
  end

  it 'factory' do
    expect(build(:user)).to be_valid
  end
end
