FactoryBot.define do
  factory :company do
    name { "#{Faker::Company.name} #{Faker::Company.suffix}" }
  end
end
