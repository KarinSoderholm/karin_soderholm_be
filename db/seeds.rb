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
karin1 = User.create!(name: "Karin Soderholm",
                      address: "1234 Main St.",
                      city: "Wheat Ridge",
                      state: "CO",
                      zip: 12345,
                      email: "karin@example.com",
                      password_digest: "SEED_ADMIN_EMAIL_PASSWORD",
                      role: 1
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

# Artist Statement
artist_statement = ArtistStatement.create!(statement: 'This is my artist statement!',
                                            user_id: karin1.id
)

# Artist Stories
artist_story = ArtistStory.create!(story: 'This is my story!',
                                    user_id: karin1.id
)

# Artwork Statement
artwork_statement = ArtworkStatement.create!(statement: 'This is an ArtworkStatement',
                                            artwork_id: crazy_calm.id
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
sewing_101 = Classroom.create!(name: "Sewing 101",
                                description: "The beginning course about sewing",
                                date: "2021-04-18",
                                time: "22:00",
                                location: "123 Main St., Wheat Ridge, CO 80033",
                                active: true,
                                cost: 65.00
)
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

# commission blooming maps
blooming_map = CommissionBloomingMap.create!(customer_name: 'George Soderholm',
                                              customer_email: 'george@example.com',
                                              customer_phone: '7203232761',
                                              message: "I'd love a map of Orcas Island. Your work is fantastic and I can't wait to see what you create! Reach out if you have any questions about anything.",
                                              map_state: 'WA',
                                              map_country: 'USA',
                                              map_flower: 'Geranium',
                                              map_color: 'green,  blue, red',
                                              commission_status: 'delivered',
                                              notes: '* wants to highlight the Tall peak on the island (look up name) * is a sailor * likes to swim',
                                              commission_payment: 'paid_in_full',
                                              price: 234
)

# Materials
# canvas = Material.create!(name: 'canvas',
#                           category: '',
#                           artwork_id: peaceful_prairie.id
# )

# Collections
maps_project_collection = Collection.create!(name: '100 Day Project: Maps',
                                collection_type: 'art'
)
pottery_project_collection = Collection.create!(name: '100 Day Project: Pottery',
                                collection_type: 'object'
)
garment_collection = Collection.create!(name: 'Garment',
                                collection_type: 'object'
)

# Artwork Collection
artwork_collection = ArtworkCollection.create!(artwork_id: crazy_calm.id,
                                              collection_id: maps_project_collection.id
)

# Contacts
contact = Contact.create!(name: 'Brian',
                          subject: 'I need your help',
                          customer_email_address: 'brian@example.com',
                          message: "Hey! What is the name of your Etsy Shop. Actually, do you have one? I'd love to shop more of your ware",
                          message_status: 'read'
)

# Email
email = Email.create!(email_address: 'gary@example.com',
                      name: 'Gary Smith'
)

# Social
social = Social.create!(instagram: 'https://www.instagram.com/so__karin/',
                        pinterest: 'pinterest.com/krsoderholm/_saved/',
                        email: 'karin@example.com',
                        user_id: karin1.id
                      )

# artwork_collections
artwork_collection1 = ArtworkCollection.create!(artwork_id: crazy_calm.id,
                                                collection_id: maps_project_collection.id
)

# physical_object_collections
object_collection1 = ObjectCollection.create!(clothing_id: gizzelle_dress.id,
                                            collection_id: garment_collection.id,
)

requirement = Requirement.create!(name: crochet_101.name,
                                  classroom_id: crochet_201.id
)

# CVs
karin_cv = Cv.create!(name: karin1.name,
                      user_id: karin1.id
)

# FAQ
faq = FrequentlyAskedQuestion.create!(question: 'How do I get ahold of you?',
                                      answer: 'Email me! karin@example.com',
                                      faq_order: 1
)

# Student Works
sally_student_work = StudentWork.create!(title: 'Paper Mache Sculpture',
                                          description: 'A 7th graders work',
                                          age_category: 'young_adult'
)

# BlogPost
blog_post = BlogPost.create!(title: 'Another Post',
                              body: "Another daily Post",
                              author: karin1.name,
                              user_id: karin1.id
)

# Tag
map_tag = Tag.create!(title: 'stitching')

# TagPost
tag_post = TagPost.create!(tag_id: map_tag.id,
                          blog_post_id: blog_post.id
)

# tool
sewing_maching = Tool.create!(name: 'Sewing Machine',
                              classroom_id: sewing_101.id
)
