FactoryGirl.define do
  factory :user do
    name "Joe Schmoe"
    sequence(:email) do |n| 
      "abc#{n}@example.com"
    end
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end
end

