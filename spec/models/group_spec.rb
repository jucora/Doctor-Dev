require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'belongs to a user' do
    group = Group.reflect_on_association(:user)
    expect(group.macro).to eq(:belongs_to)
  end
  it 'has many transactions' do
    group = Group.reflect_on_association(:transactions)
    expect(group.macro).to eq(:has_many)
  end
end
