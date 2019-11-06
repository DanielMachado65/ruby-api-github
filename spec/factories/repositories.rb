FactoryBot.define do
  factory :repository do
    owner { nil }
    full_name { "MyString" }
    private { false }
  end
end
