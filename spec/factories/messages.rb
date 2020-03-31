FactoryBot.define do

  factory :message do
    content {"グループ名"}
    association :user
    association :group
  end

end