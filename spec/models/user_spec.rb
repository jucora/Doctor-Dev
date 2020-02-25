require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe '#name' do
  	it "can't be blank" do
  		user.name = ''
  		user.valid?
  		expect(user.errors[:name]).to include("can't be blank")
  	end

  	it "should have a length of minimum 2 characters" do
  		user.name = 'a'
  		user.valid?
  		expect(user.errors[:name]).to include("is too short (minimum is 2 characters)")
  	end

  	it "should have a length of maximum 10 characters" do
  		user.name = 'a' * 11
  		user.valid?
  		expect(user.errors[:name]).to include("is too long (maximum is 10 characters)")
  	end

  	it { should validate_uniqueness_of(:name).case_insensitive }
  end
end
