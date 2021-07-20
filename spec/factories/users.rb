FactoryBot.define do
  factory :user do
    nickname              {Facker::initails(number:2)}
    email                 {Facker::Internet.free_email}
    password              {Facker::Internet.password（min_length: 6)}
    password_confirmation {password}
    first_name            {山田}
    last_name             {太郎}
    first_name_kana       {ヤマダ}
    last_name_kana        {タロウ}
    birth_date            {Facker::Date.backward}
  end
end
