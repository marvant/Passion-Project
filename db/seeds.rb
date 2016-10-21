# 20.times do
#   post = Post.create!( title: Faker::Company.catch_phrase,
#                username: Faker::Internet.user_name,
#                comment_count: rand(1000),
#                created_at: Time.now - rand(20000))

#   vote_count = rand(100)
#   vote_count.times do
#     post.votes.create!(value: 1)
#   end
# end


# Category.create(name: "Electronics")
# Category.create(name: "Auto")
# User.create(name: "Marvan", email: "m@m.com", password: "m")

