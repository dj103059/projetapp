FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  
  end
  factory :theme do
    content "Lorem ipsum"
    user
  end
  factory :chapter do
    title "Lorem ipsum"
    user
  end
  factory :anecdote do
    content "Lorem ipsum"
    user
  end
  factory :scene do
    content "Lorem ipsum"
    user
  end
  factory :character do
    name "Lorem ipsum"
    user
  end
end