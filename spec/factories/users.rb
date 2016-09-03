require 'faker'

FactoryGirl.define do
  factory :user do
    username                 Faker::Name.name
    email                    Faker::Internet.email
    password                 "password"
    password_confirmation   "password"
    member                  Faker::Lorem.words
    profile                 Faker::Lorem.sentence
    works                   Faker::Company.profession
    avatar { fixture_file_upload("spec/fixtures/img/sample_avatar.jpg", 'image/jpg') }
  end
end
