Admin.create!(email: "admin@example.com", password: "pazzword")

User.create!(
  email: "user@example.com",
  password: "pazzword",
  confirmed_at: Time.current,
)
