FactoryBot.define do
  factory :run do
    sequence(:number) { |n| n }
    loop
  end
end
