FactoryGirl.define do
  factory :jump do
    jump_number 23
    date Date.today
    location { Faker::Lorem.word }
    freefall_time 63
    equipment { Faker::Lorem.word }
    aircraft { Faker::Lorem.word }
    total_freefall_time 90
    notes { Faker::Lorem.word}
    exit_altitude 13500
    association :user
  end
end