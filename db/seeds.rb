def title_maker
  "#{Faker::Hacker.adjective} #{Faker::Hacker.ingverb} #{Faker::Hacker.noun}"
end

def body_maker
  (1..(Random.rand(0..3))).map { Faker::Hacker.say_something_smart }.join(" ")
end

(1..3).each do
  Author.create(name: Faker::Name.name)
end

(1..10).each do
  Post.create(
    title: title_maker,
    body: body_maker,
    author: Author.find(Random.rand(1..3))
  )
end

