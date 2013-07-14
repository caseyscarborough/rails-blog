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
end