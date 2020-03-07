require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { build(:group1) }

  it 'belongs to a user' do
    group = Group.reflect_on_association(:user)
    expect(group.macro).to eq(:belongs_to)
  end
  it 'has many transactions' do
    group = Group.reflect_on_association(:transactions)
    expect(group.macro).to eq(:has_many)
  end

  describe '#name' do
    it "Can't be blank" do
      group.name = ''
      group.valid?
      expect(group.errors[:name]).to include("can't be blank")
    end
  end
end
