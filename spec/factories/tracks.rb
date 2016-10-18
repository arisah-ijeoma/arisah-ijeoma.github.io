FactoryGirl.define do
  factory :invalid_track, class: Track do
    title "Destiny"
    artiste "Jay"

    trait :valid do
      audio { File.new(File.join(Rails.root, 'spec', 'support', 'Mashup_Track_4.mp3')) }
    end

    trait :wrong_audio do
      audio { File.new(File.join(Rails.root, 'spec', 'support', 'marvel.png')) }
    end

    factory :track, traits: [:valid]
    factory :invalid_extension, traits: [:wrong_audio]
  end
end
