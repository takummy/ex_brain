require 'rails_helper'

RSpec.feature "書籍機能", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  background do
    book = FactoryBot.create(:book, user_id: user.id)
    FactoryBot.create(
      :book, 
      title: "GOT",
      description: "七王国のやつ", 
      user_id: user.id
    )

    visit root_path
    click_on 'ログイン'

    fill_in 'メールアドレス', with: "jensen@email.com"
    fill_in 'パスワード', with: "password"

    click_on "ログインする"
  end

  scenario "マイページ(書籍一覧)のテスト" do
    visit user_path(user.id)

    expect(page).to have_content "パピーポッティー"
    expect(page).to have_content "七王国のやつ"
  end

  scenario "書籍作成のテスト" do
    visit new_book_path

    fill_in 'タイトル', with: "指輪なくす物語"
    fill_in '概要', with: "チビがなくした指輪をチビが拾った話"

    click_on "登録"

    expect(page).to have_content "指輪なくす物語"
    expect(page).to have_content "チビがなくした指輪をチビが拾った話"
    expect(page).to have_content "問題を作成する"
  end

  scenario "書籍編集のテスト" do
    book = FactoryBot.create(:book, user_id: user.id)
    visit edit_book_path(book.id) 
    click_on "登録"
    
    expect(page).to have_content "パピーポッティー"
    expect(page).to have_content "まだ問題が作成されていません"
  end

  scenario "書籍削除のテスト" do
    book = FactoryBot.create(:book, title: "パピーポッティー2", description: "魔法学校でよくわからん部屋行く", user_id: user.id)
    visit edit_book_path(book.id)
    click_on "削除"

    expect(page).not_to have_content "魔法学校でよくわからん部屋行く"
  end
end