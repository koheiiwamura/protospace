FactoryGirl.define do

  factory :image do
    image { fixture_file_upload("spec/fixtures/img/sample_avatar.jpg", 'image/jpg') }

    trait :main do
      roll :main
    end

    trait :sub do
      roll :sub
    end
  end
end
