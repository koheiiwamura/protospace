require 'faker'

FactoryGirl.define do
  factory :prototype do
    title                 Faker::Lorem.sentence
    catch_copy            Faker::Lorem.sentence
    concept               Faker::Lorem.paragraph
    created_at            Faker::Time.between(2.days.ago, Time.now, :all)
    user

    trait :prototype_with_likes do
      transient do
        likes_count 1
      end
      after(:create) do |prototype, evaluator|
        prototype.likes << create_list(:like, evaluator.likes_count)
      end
    end

    trait :prototype_with_comments do
      transient do
        comments_count 1
      end
      after(:create) do |prototype, evaluator|
        prototype.comments << create_list(:comment, evaluator.comments_count)
      end
    end

    trait :prototype_with_sub_images do
      transient do
        sub_image_count 1
      end
      after(:create) do |prototype, evaluator|
        prototype.comments << create_list(:comment, evaluator.comments_count)
      end
    end
  end
end
