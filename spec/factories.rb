FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "User #{n}" }
    sequence(:email) { |n| "mymail#{n}@youmark.com"}   
    password "secret"
    password_confirmation "secret"
  end

  factory :youtube_link do
    user
    url "http://www.youtube.com/watch?v=RvE9Lmzq5aM&feature=g-vrec"  
  end

  factory :a_link, class: YoutubeLink do
    user
    sequence(:url ) { |n| "http://link_to_#{n}" }
  end
end
