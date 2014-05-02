FactoryGirl.define do
  factory :picture do
    name { Faker::Lorem.word }
    picture_url "http://critterbabies.com/wp-content/gallery/kittens/happy-kitten-kittens-5890512-1600-1200.jpg"
  end
end