FactoryBot.define do
  factory :buyer do
    post_code           { '123-1234' }
    prefecture_id       { Faker::Number.between(from: 2, to: 48) }
    municipality        { '東京市' }
    house_num           { '東京1-1' }
    building            { '東京ビル'}
    telephone           { '09012345678' }
    association :item
    user{ item.user }
  end
end
