
FactoryGirl.define do
  factory :review, :class => Refinery::Reviews::Review do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

