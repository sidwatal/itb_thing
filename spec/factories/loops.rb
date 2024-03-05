FactoryBot.define do
  factory :loop do
    profile_name { Faker::TvShows::Simpsons.character }
    starting_pilot factory: :pilot
  end
end
