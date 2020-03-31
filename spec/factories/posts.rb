FactoryBot.define do

  factory :post do
    title {"投稿テスト"}
    text  {"こんにちは"}
    association :user
  end

end