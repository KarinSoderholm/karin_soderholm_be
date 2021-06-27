# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# users
august = User.create!(name: "August",
                      address: "1234 Main St.",
                      city: "Rochester",
                      state: "MN",
                      zip: 12345,
                      email: "august@example.com",
                      password_digest: "test"
)
karin = User.create!(name: "Karin Soderholm",
                      address: "1234 Main St.",
                      city: "Wheat Ridge",
                      state: "CO",
                      zip: 12345,
                      email: "karin@example.com",
                      password_digest: "test"
)
sylvia = User.create!(name: "Sylvia",
                      address: "1234 Main St.",
                      city: "Big Sky",
                      state: "MT",
                      zip: 12345,
                      email: "sylvia@example.com",
                      password_digest: "test"
)
# artworks
peaceful_prairie = Artwork.create!(name: "Peaceful Prairie",
                                  description: "Inspired by the eastern plains of Colorado",
                                  create_date: "2021-01-12 02:43:16.644577",
                                  sell_date: nil,
                                  cost: 350.00,
                                  available: true
)
crazy_calm = Artwork.create!(name: "Crazy Calm",
                            description: "The calm that comes over you in by a high mountain lake",
                            create_date: "2021-01-12 02:43:16.644577",
                            sell_date: nil,
                            cost: 450.00,
                            available: true
)

# clothings
gizzelle_dress = Clothing.create!(name: "Gizzelle Dress",
                                  description: "A funky flowy dress designed to make you stand out!",
                                  category: "Dress",
                                  available: false,
                                  origin_date: "2020-10-18",
                                  cost: 350.00
)
uppsalla_jacket = Clothing.create!(name: "Uppsalla Jacket",
                                  description: "This imaginative creation is functional, yet fun",
                                  category: "Outer Wear",
                                  available: true,
                                  origin_date: "2020-10-18",
                                  cost: 550.00
)

# workshops
crochet_101 = Classroom.create!(name: "Crochet 101",
                                description: "The beginning course about crochet",
                                date: "2021-04-18",
                                time: "22:00",
                                location: "123 Main St., Wheat Ridge, CO 80033",
                                active: true,
                                cost: 65.00
)
crochet_201 = Classroom.create!(name: "Crochet 201",
                                description: "The intermediate course about crochet",
                                date: "2021-04-20",
                                time: "22:00",
                                location: "123 Main St., Wheat Ridge, CO 80033",
                                active: true,
                                cost: 65.00
)
