FactoryBot.define do
  factory :answer do
    question { nil }
    content { "MyString" }
    correct { false }
  end
end