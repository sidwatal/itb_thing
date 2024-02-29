FactoryBot.define do
  factory :pilot do
    name { Faker::Name.name }
    nickname { Faker::FunnyName.name }
    debug_name { "pilot_#{nickname}" }
  end
end
