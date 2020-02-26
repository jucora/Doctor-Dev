require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it 'belongs to a user' do
    transaction = Transaction.reflect_on_association(:user)
    expect(transaction.macro).to eq(:belongs_to)
  end
  it 'belongs to a group' do
    transaction = Transaction.reflect_on_association(:group)
    expect(transaction.macro).to eq(:belongs_to)
  end
end
