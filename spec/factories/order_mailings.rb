FactoryBot.define do
  factory :order_mailing do
    postal_code          { "123-4567"}
    prefecture_id        { 3 }
    city                 {"千葉市"}
    address              {"千葉55-5-5"}
    tel                  {"0123456789"}
    order_id             { 4 }
    token                {"tok_abcdefg123456789"}
  end
end