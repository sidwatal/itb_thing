FactoryBot.define do
  factory :loop do
    profile_name { Faker::TvShows::Simpsons.character }
  end
end
