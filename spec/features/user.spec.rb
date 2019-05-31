require 'rails_helper'

RSpec.feature "ユーザー機能", type: :feature do
  let(:now) { Date.current }
  background do
    FactoryBot.create(:user, id: 12)
    FactoryBot.create(
      :user, id: 13, 
      name: "Owen", 
      email: "owen@email.com", 
      password: "password"
    )
  end

  feature "ログイン前" do
    scenario "ユーザー登録のテスト" do
      visit root_path
      click_on "新規登録"

      fill_in '名前', with: "John"
      fill_in 'メールアドレス', with: "john@email.com"
      fill_in 'パスワード', with: "password"
      fill_in '確認用パスワード', with: "password"

      click_on "登録"
      expect(page).to have_content "ログアウト"
      expect(page).to have_content "John"
      expect(page).to have_content "john@email.com"
    end

    scenario "ログイン/ログアウトのテスト" do
      visit root_path
      click_on 'ログイン'

      fill_in 'メールアドレス', with: "jensen@email.com"
      fill_in 'パスワード', with: "password"

      click_on "ログインする"

      expect(page).to have_content "ログインしました。"

      click_on "ログアウト"
      expect(page).to have_content "ログアウトしました。"
    end

    scenario "ログインなしでは書籍登録ページへ飛べないテスト" do
      visit new_book_path

      expect(page).to have_content "アカウント登録もしくはログインしてください。"
    end
  end

  feature "ログイン後" do
    background do
      visit root_path
      click_on 'ログイン'

      fill_in 'メールアドレス', with: "jensen@email.com"
      fill_in 'パスワード', with: "password"

      click_on "ログインする"
    end

    scenario "ログインしていると登録画面へ飛べないテスト" do
      visit new_user_registration_path
      expect(page).to have_content "すでにログインしています。"
    end

    scenario "自分以外のマイページへ飛べないテスト" do
      visit user_path(13)
      expect(page).to have_content "権限がありません"
    end

    scenario "アカウント削除テスト" do
      visit edit_user_registration_path(13)
      click_on "アカウントを削除する"
      expect(page).to have_content "アカウントを削除しました。またのご利用をお待ちしております。"
    end
  end
end