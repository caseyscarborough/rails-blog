FactoryGirl.define do
  factory :first_post, class: Post do
    title "First Post"
    content "This is the first post."
  end

  factory :second_post, class: Post do
    title "Second Post"
    content "This is the second post."
  end

  factory :random_post, class: Post do
    title "Random Post"
    content "This is a random post."
  end

  factory :user do
    username "test"
    email "test@example.com"
    first_name "Test"
    last_name "User"
    password "password"
    password_confirmation "password"
    is_admin true
  end
end