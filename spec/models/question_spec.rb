require 'rails_helper'

RSpec.describe Question, type: :model do
  user = User.create!(name: "スペックマン2", email: "specman2@email.com", password: "specman2")
  book = user.books.build(title: "パピーポッティー", description: "読み応え抜群")

  describe "presence: trueのバリデーション" do
    it "contentが空ならバリデーションが通らない" do
      question = book.questions.build(content: "")
      expect(question).not_to be_valid
    end
  end

  describe "lengthのバリデーション" do
    text = "バリ"
    it "contentが201文字以上ならバリデーションが通らない" do
      question = book.questions.build(content: "#{text * 101}")
      expect(question).not_to be_valid
    end
  end

  describe "answersのバリデーション" do
    it "answersに正解(true)が含まれていなければバリデーションが通らない" do
      question = book.questions.build(content: "質問です")
      question.answers.build(content: "質問の答え1", correct: false)
      question.answers.build(content: "質問の答え2", correct: false)
      question.answers.build(content: "質問の答え3", correct: false)
      expect(question).not_to be_valid
    end

    it "answersに正解(true)が一つ以上含まれているとバリデーションが通らない" do
      question = book.questions.build(content: "質問です")
      question.answers.build(content: "質問の答え1", correct: true)
      question.answers.build(content: "質問の答え2", correct: true)
      question.answers.build(content: "質問の答え3", correct: false)
      expect(question).not_to be_valid
    end
  end
end