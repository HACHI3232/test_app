FactoryBot.define do
  factory :post do
    word { "irb" }
    mean { "対話形式でプログラムを実行できるようになるコマンド" }
    association :category
  end
end
