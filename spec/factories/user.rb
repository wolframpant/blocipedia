FactoryGirl.define do
  factory :user do
    name "Joe Schmoe"
    email "abc@example.com"
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end
end

