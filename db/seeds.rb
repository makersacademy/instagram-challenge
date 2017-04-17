User.create!([
  {email: "bob@test.com", encrypted_password: "$2a$10$0yf0n7XnZDo5e/lMIzQVM.ulET9UGL9c/V.5fuYS8uwEHe9jvEuaO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-09-07 19:42:45", last_sign_in_at: "2015-09-07 19:42:45", current_sign_in_ip: "::1", last_sign_in_ip: "::1"},
  {email: "ben@test.com", encrypted_password: "$2a$10$PnBtoDRQALhAUPgYYopH0OqNeLO/r4LOOTHkL86qqquf0MA958a.C", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-09-10 13:21:37", last_sign_in_at: "2015-09-08 07:10:49", current_sign_in_ip: "::1", last_sign_in_ip: "::1"}
])
Comment.create!([
  {comment: "Amazing shot. ", photo_id: 2, user_id: 2},
  {comment: "Great vending :)", photo_id: 6, user_id: 2}
])
Like.create!([
  {like: nil, user_id: 1, photo_id: 1},
  {like: nil, user_id: 1, photo_id: 2},
  {like: nil, user_id: 2, photo_id: 3},
  {like: nil, user_id: 2, photo_id: 6}
])
Photo.create!([
  {description: "Mountains!", picture: "", user_id: 1, image_file_name: "1928817_504902187044_2091_n.jpg", image_content_type: "image/jpeg", image_file_size: 61479, image_updated_at: "2015-09-07 19:43:03"},
  {description: "More Mountains!", picture: "", user_id: 1, image_file_name: "10402895_10100575292413122_683048372780433177_n.jpg", image_content_type: "image/jpeg", image_file_size: 95671, image_updated_at: "2015-09-07 19:44:32"},
  {description: "Bali :)", picture: "", user_id: 2, image_file_name: "IMAG0763.jpg", image_content_type: "image/jpeg", image_file_size: 1170768, image_updated_at: "2015-09-07 20:02:49"},
  {description: "Les Crosets, CH", picture: nil, user_id: 2, image_file_name: "10304770_10100575377871862_5620017557048556698_n.jpg", image_content_type: "image/jpeg", image_file_size: 91508, image_updated_at: "2015-09-08 07:20:10"},
  {description: "Lake", picture: nil, user_id: 2, image_file_name: "20080122_1592.JPG", image_content_type: "image/jpeg", image_file_size: 7220484, image_updated_at: "2015-09-10 13:22:13"},
  {description: "Tokyo Vending!", picture: nil, user_id: 2, image_file_name: "IMAG1144.jpg", image_content_type: "image/jpeg", image_file_size: 1935248, image_updated_at: "2015-09-10 14:02:45"}
])
