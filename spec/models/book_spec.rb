require 'rails_helper'

RSpec.describe Book, type: :model do
  user = User.create!(name: "スペックマン", email: "specman@email.com", password: "specman")
  describe "presence: trueのバリデーション" do
    it "titleが空ならバリデーションが通らない" do
      book = user.books.build(title: "", description: "読み応え抜群")
      expect(book).not_to be_valid
    end

    it "describeが空ならバリデーションが通らない" do
      book = user.books.build(title: "パピーポッティー", description: "")
      expect(book).not_to be_valid
    end

    it "title, descriptionが入力されていればバリデーションを通過" do
      book = user.books.build(title: "パピーポッティー", description: "読み応え抜群")
      expect(book).to be_valid
    end
  end

  describe "lengthのバリデーション" do
    text = "バリ"
    it "titleが51文字以上ならバリデーションが通らない" do
      book = user.books.build(title: "#{text * 26}", description: "読み応え抜群")
      expect(book).not_to be_valid
    end

    it "descriptionが150文字以上ならバリデーションが通らない" do
      book = user.books.build(title: "ぱぴーぽってぃー", description: "#{text * 76}")
      expect(book).not_to be_valid
    end
  end
end