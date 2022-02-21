FactoryBot.define do

  factory :item do
    product_name           { Faker::Name.name }
    product_description    { Faker::Lorem.sentence }
    category_id            { Faker::Number.between(from: 2, to: 48) }
    situation_id           { Faker::Number.between(from: 2, to: 48) }
    charge_id              { Faker::Number.between(from: 2, to: 48) }
    prefecture_id          { Faker::Number.between(from: 2, to: 48) }
    day_ship_id            { Faker::Number.between(from: 2, to: 48) }
    price                  { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end

  end

end

