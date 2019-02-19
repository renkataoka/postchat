#ユーザ
User.create!(name: "A Example User",
             email: "example@railstutorial.org",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now,
             thumb: open("#{Rails.root}/db/fixtures/init_thumb.png"))

User.create!(name: "Example User",
            email: "example-0@railstutorial.org",
            password: "password",
            password_confirmation: "password",
            activated: true,
            activated_at: Time.zone.now,
            thumb: open("#{Rails.root}/db/fixtures/kitten.jpg"))

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  thumb = "#{Rails.root}/db/fixtures/init_thumb.png"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now,
               thumb: open(thumb))
end

#マイクロポスト
users = User.order(:updated_at).take(10)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

#リレーションシップ
users = User.all
user = users.find_by(id:1)
following = users[5..55]
followers = users[4..45]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
