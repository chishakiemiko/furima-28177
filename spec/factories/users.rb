FactoryBot.define do
  factory :user do
    nickname              { "name" }
    email                 { "email@email.com" }
    password              { "abcd5678" }
    password_confirmation { "abcd5678" }
    family_name           { "樗木" }
    first_name            { "恵美子" }
    family_name_kana      { "チシャキ" }
    first_name_kana       { "エミコ" }
    birth_date            { Faker::Date.birthday }
  end
end
