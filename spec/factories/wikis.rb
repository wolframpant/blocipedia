FactoryGirl.define do
  factory :wiki do
    title "MyString"
    body "MyText"
    published_at "2014-11-11 18:31:54"
    
    factory :wiki_with_users do

      after(:create) do |wiki|
        wiki.users << FactoryGirl.create(:user)
        wiki.save!
      end
    end
  end
end
