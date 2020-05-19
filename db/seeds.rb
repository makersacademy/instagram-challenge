require 'faker'

User.create(
  name: "Lila Walker",
  email: "lilawlker@gmail.com",
  password: "password",
)

user = User.create(
  name: Faker::Name.unique.name,
  email: Faker::Internet.unique.email,
  password: Faker::Internet.password(min_length: 6, max_length: 10),
)

images = []

15.times do |i|
  images << "db/seeds/images/image#{i}.jpeg"
end

5.times do |n|
  user = User.create(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 6, max_length: 10),
  )

  3.times do |x|
    Timecop.return
    picture = Picture.create!(
      user: user,
    )

    picture.image.store!(File.open(Rails.root.join(images.pop)))
    picture.save!

    Timecop.freeze(Time.zone.now - n.days - x.hours)
    picture.touch(:created_at)

    rand(0..5).times do |c|
      Timecop.freeze(Time.now - c.hours)
      Comment.create!(
        picture_id: picture.id,
        user_id: User.all.sample.id,
        text: Faker::Lorem.paragraph,
      )
    end

    rand(0..10).times do |l|
      Like.create!(
        picture_id: picture.id,
        user_id: User.all.sample.id,
      )
    end
  end
end

Timecop.return
