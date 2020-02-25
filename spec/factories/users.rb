FactoryBot.define do
  factory :user1, class: User do
    name { 'john' }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :user2, class: User do
    name { 'julian' }
    password { 'password' }
    password_confirmation { 'another_password' }
  end

  factory :user3, class: User do
    name { 'john' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
