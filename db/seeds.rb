# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


AdminUser.destroy_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Comment.destroy_all
Post.destroy_all
User.destroy_all

10.times do |i|
  User.create!(
    email: "usuario#{i}@gmail.com",
    password: "12345678"
  )
end

users = User.all.pluck(:id)

10.times do |i|
  Post.create!(
    user_id: users.sample,
    title: "Lorem Ipsum #{i}!",
    content: Faker::Lorem.paragraph,
    created_at: Faker::Number.number(1).to_i.day.ago
  )
end

posts = Post.all.pluck(:id)

20.times do
  Comment.create!(
    post_id: posts.sample,
    user_id: users.sample,
    content: Faker::Lorem.paragraph
  )
end
