FactoryBot.define do
  factory :order do
    name { "MyString" }
    email { "MyString" }
    phone { "MyString" }
    project_type { "MyString" }
    message { "MyText" }
    status { "MyString" }
  end
end
