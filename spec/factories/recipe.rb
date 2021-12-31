# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    user
    sequence(:title) { |s| "title_#{s}" }
    sequence(:cal_per_serv) { 350 }
    sequence(:yields) { 4 }
    sequence(:time) { 140 }
    sequence(:description) { |s| "description_#{s}" }
  end
end
