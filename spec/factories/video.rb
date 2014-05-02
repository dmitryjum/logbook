FactoryGirl.define do
  factory :video do
    name { Faker::Lorem.word }
    video_url "http://www.youtube.com/embed/8NySwzaZ9y8"
  end
end

