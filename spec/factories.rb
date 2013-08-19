# encoding: UTF-8
FactoryGirl.define do
  factory :recipe do
    name { Faker::Lorem.words(3).join(' ') }
  end
  factory :menu do
    nb_days 5
    nb_meals_per_day 2
  end
  factory :day do; end
  factory :meal do; end
end
