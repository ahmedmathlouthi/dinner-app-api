# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    title       { Faker::Food.dish }
    category    { Faker::Food.ethnic_category }
    cuisine     { Faker::Address.country }
    author      { Faker::Name.first_name }
    ratings      { Faker::Number.decimal(l_digits: 1) }
    prep_time   { Faker::Number.between(from: 10, to: 20) }
    cook_time   { Faker::Number.between(from: 10, to: 20) }
    ingredients do
      9.times.map do |_i|
        "#{Faker::Food.measurement} #{Faker::Food.ingredient}"
      end.join(',')
    end
  end
end
