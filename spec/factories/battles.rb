FactoryBot.define do
  factory :battle do
    name { "#{run.loop.profile_name}_#{run.number}" }
    run
  end
end
