FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    password { "qwer1234" }
    password_confirmation { "qwer1234" }
    nickname { "testname" }
    first_name { "名字" }
    last_name { "名前" }
    first_name_reading {"ミョウジ"}
    last_name_reading {"ナマエ"}
    birth_date { "1999-01-01" }

  end
end
