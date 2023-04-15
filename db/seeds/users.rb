User.create!(
  email: "user@example.com",
  password: "pazzword",
  &:skip_confirmation!
)

100.times do
  User.create!(
    email: "#{SecureRandom.hex(3)}@example.com",
    password: "pazzword",
    &:skip_confirmation_notification!
  )
end
