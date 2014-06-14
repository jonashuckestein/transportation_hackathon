Group.destroy_all
User.destroy_all

group = Group.create!(
  description: "Neukölln Crew",
  route: "Bla",
  leave_from: "Le Labo",
  leave_at: Time.new(2014, 6, 15, 19, 00),
)

User.create!(
  name: "Bill R.",
  profile_image: "bill.jpeg",
  has_car: true,
  car_spots: 2,
  group: group,
  leave_after: Time.new(2014, 6, 15, 18, 00),
  leave_before: Time.new(2014, 6, 15, 20, 00),
  destination_address: "Schöneweider str 3, berlin",
)

User.create!(
  name: "Chet K.",
  profile_image: "chet.jpeg",
  has_car: false,
  group: group,
  leave_after: Time.new(2014, 6, 15, 18, 30),
  leave_before: Time.new(2014, 6, 15, 19, 00),
  destination_address: "Neukölln S-bahn, berlin",
)

u = User.create!(
  name: "Josh S.",
  profile_image: "josh.jpeg",
  has_car: false,
  group: group,
  leave_after: Time.new(2014, 6, 15, 18, 30),
  leave_before: Time.new(2014, 6, 15, 19, 30),
  destination_address: "Neukölln S-bahn, berlin",
)


group.update_attribute(:driver, u)
