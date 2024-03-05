FactoryBot.define do
  factory :run do
    loop

    sequence(:number) { |n| n }
    status { 'pending' }
    result { 'unknown' }
  end
end
