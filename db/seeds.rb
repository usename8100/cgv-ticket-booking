# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create sample account
User.create!(name: "long test", email: "trinhminhlongad@gmail.com", password: "qweqwe", password_confirmation: "qweqwe",
  gender: true, phone_number: "0123456789", activated: true, activated_at: Time.zone.now)

User.create!(name: "long test", email: "mail@gmail.com", password: "qweqwe", password_confirmation: "qweqwe",
  gender: false, phone_number: "0123455789", activated: true, activated_at: Time.zone.now)

MovieGenre.create!(genre: "Action")
MovieGenre.create!(genre: "Sci-fi")
MovieGenre.create!(genre: "Comedy")
MovieGenre.create!(genre: "Animation")
MovieGenre.create!(genre: "Drama")
MovieGenre.create!(genre: "Horror")
MovieGenre.create!(genre: "Documentary")
MovieGenre.create!(genre: "Love Story")

Movie.create!(title: "Shangchi", movie_genre_id: 1, length: "132", director: "Destin", cast: "Simu Liu",
  image_link: "https://marvelphim.com/wp-content/uploads/2021/04/shang-chi-poster.jpeg",
  start_date: Time.zone.now, rated: "PG-13", language: "English",
  description: "Hàng ngàn năm trước, Văn Vũ (Mandarin) tìm thấy Thập Luân, mười vũ khí thần bí giúp người dùng bất tử và có sức mạnh to lớn. Văn Vũ tích lũy một đội quân chiến binh được gọi là Thập Luân và chinh phục nhiều vương quốc và lật đổ các chính phủ trong suốt chiều dài lịch sử. Năm 1996, Văn Vũ bắt đầu tìm kiếm ngôi làng Đại La (大羅), nơi được cho là chứa nhiều linh thú, để mở rộng quyền lực của mình.")
Movie.create!(title: "Free Guy", movie_genre_id: 2, length: "132", director: "Destin", cast: "Ryan Reynold",
  image_link: "https://cdn.shopify.com/s/files/1/0057/3728/3618/products/freeguy.125811.ar_480x.progressive.jpg?v=1573855689",
  start_date: Time.zone.now, rated: "PG-13", language: "English",
  description: "Hàng ngàn năm trước, Văn Vũ (Mandarin) tìm thấy Thập Luân, mười vũ khí thần bí giúp người dùng bất tử và có sức mạnh to lớn. Văn Vũ tích lũy một đội quân chiến binh được gọi là Thập Luân và chinh phục nhiều vương quốc và lật đổ các chính phủ trong suốt chiều dài lịch sử. Năm 1996, Văn Vũ bắt đầu tìm kiếm ngôi làng Đại La (大羅), nơi được cho là chứa nhiều linh thú, để mở rộng quyền lực của mình.")
Movie.create!(title: "My Spy", movie_genre_id: 3, length: "132", director: "Destin", cast: "Dave Baustia",
  image_link: "https://m.media-amazon.com/images/M/MV5BNzMyOWRjYjUtMjc2OC00MWUyLWEzODktYWZlZDYxYjk4MDViXkEyXkFqcGdeQXVyODE0OTU5Nzg@._V1_.jpg",
  start_date: Time.zone.now, rated: "PG-13", language: "English",
  description: "Hàng ngàn năm trước, Văn Vũ (Mandarin) tìm thấy Thập Luân, mười vũ khí thần bí giúp người dùng bất tử và có sức mạnh to lớn. Văn Vũ tích lũy một đội quân chiến binh được gọi là Thập Luân và chinh phục nhiều vương quốc và lật đổ các chính phủ trong suốt chiều dài lịch sử. Năm 1996, Văn Vũ bắt đầu tìm kiếm ngôi làng Đại La (大羅), nơi được cho là chứa nhiều linh thú, để mở rộng quyền lực của mình.")

20.times do |x|
  Movie.create(title: Faker::Movie.title, movie_genre_id: Random.rand(1..8), length: 120 + Random.rand(60), director: "Destin", cast: Faker::Movies::BackToTheFuture.character,
  image_link: "https://m.media-amazon.com/images/M/MV5BNzMyOWRjYjUtMjc2OC00MWUyLWEzODktYWZlZDYxYjk4MDViXkEyXkFqcGdeQXVyODE0OTU5Nzg@._V1_.jpg",
  start_date: Faker::Date.in_date_period, rated: "PG-13", language: "English",
  description: "Hàng ngàn năm trước, Văn Vũ (Mandarin) tìm thấy Thập Luân, mười vũ khí thần bí giúp người dùng bất tử và có sức mạnh to lớn. Văn Vũ tích lũy một đội quân chiến binh được gọi là Thập Luân và chinh phục nhiều vương quốc và lật đổ các chính phủ trong suốt chiều dài lịch sử. Năm 1996, Văn Vũ bắt đầu tìm kiếm ngôi làng Đại La (大羅), nơi được cho là chứa nhiều linh thú, để mở rộng quyền lực của mình.")
end
