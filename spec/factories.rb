require 'factory_girl'

FactoryGirl.define do
  
  factory :user do
    sequence(:email)        {|n| "jesse.ocon#{n}@gmail.com"}
    name 'Jesse Ocon'
    password 'foobar123'
    password_confirmation 'foobar123'
  end
  
  factory :highlight do
    title 'Nice Travels' 
    description 'Short description for testing'
    user
  end

end