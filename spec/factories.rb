FactoryGirl.define do
  factory :user do
    pass= "12345678"
    name Faker::Name.name
    admin false
    email Faker::Internet.email
    password pass
    password_confirmation pass
    factory :primary_admin do
      name "Muhammad Tamzid"
      email "muhammad.tamzid@gmail.com"
      admin true
    end
    factory :admin do
      email "admin-#{Faker::Lorem.characters 3}@framgia.com"
      admin true
    end
  end

  factory :book do
    category_id {Category.take.id if Category.exists?}
    title Faker::Name.name
    author Faker::Name.name
    publish_date Faker::Date.backward((Faker::Number.number 3).to_i)
    page Faker::Number.number 3
    rating Faker::Number.between 1, 5
  end

  factory :comment do
    content Faker::Lorem.paragraph
    user_id {User.take.id if User.exists?}
    review_id {Review.take.id if Review.exists?}
  end

  factory :like do
    activity_id 1
    user_id {User.take.id if User.exists?}
  end

  factory :relationship do
    follower_id {User.first.id if User.exists?}
    followed_id {User.second.id if User.count > 1}
  end

  factory :request do
    user_id {User.take.id if User.exists?}
    title Faker::Name.name
    author Faker::Name.name
    link Faker::Internet.url
    status :pending
    publisher Faker::Name.name
  end

  factory :review do
    user_id {User.take.id if User.exists?}
    book_id {Book.take.id if Book.exists?}
    rating Faker::Number.between 1, 5
    content Faker::Lorem.paragraph
  end

  factory :user_book do
    user_id {User.take.id if User.exists?}
    book_id {Book.take.id if Book.exists?}
    favourite false
    status Faker::Number.between 1, 4
  end

  factory :book_photo do
    book_id {Book.take.id if Book.exists?}
    image "img_n.png"
  end

  factory :category do
    name Faker::Name.name
  end
end