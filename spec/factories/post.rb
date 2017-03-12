FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Question #{n}" }
    sequence(:body)  { |n| "Question text #{n}" }
    end
  end