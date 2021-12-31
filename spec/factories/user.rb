# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:username) { |s| "username_#{s}" }
    sequence(:email) { |s| "email#{s}@example.pl" }
    sequence(:password) { |s| "GcAbAijoW_#{s}" }
  end
end
