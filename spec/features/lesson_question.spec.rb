require 'rails_helper'

RSpec.feature "問題解答機能", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:book) { FactoryBot.create(:book, user_id: user.id) }

  background do
    question_1 = FactoryBot.create(
      :question,
      book_id: book.id,
      answers_attributes: {
        0 => {
          content: "例のあの人との戦い",
          correct: 1
        },
        1 => {
          content: "指輪拾う",
          correct: 0
        },
        2 => {
          content: "宇宙で戦",
          correct: 0
        }
      }
    )

    question_2 = FactoryBot.create(
      :question,
      content: "主人公の名前は？",
      book_id: book.id,
      answers_attributes: {
        0 => {
          content: "パピーポッティー",
          correct: 1
        },
        1 => {
          content: "フロウド",
          correct: 0
        },
        2 => {
          content: "ジョン万次郎",
          correct: 0
        }
      }
    )

    visit root_path
    click_on 'ログイン'

    fill_in 'メールアドレス', with: "jensen@email.com"
    fill_in 'パスワード', with: "password"

    click_on "ログインする"
  end

  feature "解答機能" do
    scenario "全問正解時のテスト" do
      visit user_path(user.id)

      click_on "スタート"
      click_on "パピーポッティー"
      click_on "例のあの人との戦い"
      click_on "戻る"
      click_on "前回の成績"

      expect(page).to have_content "結果: 2 / 2"
    end

    scenario "全問不正解時のテスト" do
      visit user_path(user.id)

      click_on "スタート"
      click_on "フロウド"
      click_on "指輪拾う"
      click_on "戻る"
      click_on "前回の成績"

      expect(page).to have_content "結果: 0 / 2"
    end
  end

  feature "削除機能" do
    scenario "結果一覧画面の削除ボタン" do
      visit user_path(user.id)

      click_on "スタート"
      click_on "フロウド"
      click_on "指輪拾う"
      click_on "削除"

      expect(page).to have_content "前回の成績を削除しました"
    end

    scenario "結果一覧画面の削除ボタン" do
      visit user_path(user.id)

      click_on "スタート"
      click_on "フロウド"
      click_on "指輪拾う"
      click_on "戻る"

      expect(page).not_to have_content "スタート"
      expect(page).to have_content "前回の成績"
      expect(page).to have_content "前回の成績を削除"

      click_on "前回の成績を削除"

      expect(page).to have_content "前回の成績を削除しました"
    end
  end
end