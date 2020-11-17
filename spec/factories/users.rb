FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {'123xyz'}
    password_confirmation {password}
    nickname              {Faker::Name.initials(number: 2)}
    birthday              {'2000-03-24'}
    gender                {"female"}
    height                {180}
    diet_reason           {"モテるため"}
  end
end
