FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"123abc"}
    password_confirmation {password}
    last_name             {"点検"}
    first_name            {"点検"}
    last_name_kana        {"テスト"}
    first_name_kana       {"テスト"}
    date_of_birth         {"2000-01-22"}
  end
end