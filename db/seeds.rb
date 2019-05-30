require 'faker'

Faker::Config.locale = :ja

User.create!(
  name: "you",
  email: "you@email.com",
  password: "password"
  )

user = User.find_by(name: "you")

20.times do
  book = user.books.build(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph
  )

  10.times do
    question = book.questions.build(
      content: Faker::Coffee.notes
    )

    3.times do
      answer = question.answers.build(
        content: Faker::Coffee.notes,
        correct: 0
      )
    end

    question.answers[rand(0..2)].correct = true
    question.save!
  end
end

