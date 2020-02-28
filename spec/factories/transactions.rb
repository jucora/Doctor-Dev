FactoryBot.define do
  factory :transaction1, class: Transaction do
    # author_id {  }
    name { 'Thanks for the course' }
    amount { 20 }
  end
end
