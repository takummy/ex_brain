require 'rails_helper'

RSpec.feature "問題機能", type: :feature do
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

  scenario "問題一覧のテスト" do
    visit book_path(book.id)

    expect(page).to have_content "パピーポッティー"
    expect(page).to have_content "例のあの人との戦い"
  end

  scenario "問題作成のテスト" do
    visit new_book_question_path(book.id)

    fill_in '問題', with: "getとpostの違いは？"
    fill_in 'question_answers_attributes_0_content',
            with: "リクエストの送り方が違う。GETはURLに送りたいデータが表示される。
                  POSTはHTTPリクエスト内のメッセージボディにデータが入る。"
    fill_in 'question_answers_attributes_1_content',
            with: "リクエストの送り方が違う。GETはHTTPリクエスト内のメッセージボディにデータが入る。
                  POSTはURLに送りたいデータが表示される。"
    fill_in 'question_answers_attributes_2_content',
            with: "POSTを利用してログインするとURLにデータが組み込まれるため,
                  送ったデータがブラウザの履歴に残ってしまう。"

    check 'question_answers_attributes_0_correct'

    click_on "登録する"

    expect(page).to have_content "getとpostの違いは？"
    expect(page).to have_content "リクエストの送り方が違う。"
    expect(page).to have_content "問題一覧"
  end

  scenario "問題編集のテスト" do
    visit edit_question_path(book.questions.first.id)

    expect(page).to have_content "どんな話？"
    expect(page).to have_content "例のあの人との戦い"
    expect(page).to have_content "指輪拾う"
    expect(page).to have_content "宇宙で戦"

    fill_in '問題', with: "主人公の親友の名前は？"
    fill_in 'question_answers_attributes_0_content',
            with: "ボブ"
    fill_in 'question_answers_attributes_1_content',
            with: "サム"
    fill_in 'question_answers_attributes_2_content',
            with: "サムウェル"

    uncheck 'question_answers_attributes_2_correct'
    check 'question_answers_attributes_1_correct'

    click_on "更新する"

    expect(page).to have_content "問題一覧"
    expect(page).to have_content "サム"
  end

  scenario "質問削除のテスト" do
    visit book_path(book.id)

    page.first('table > tbody > tr > td > a.delete').click
    visit book_path(book.id)

    expect(page).not_to have_content "主人公の名前は？"
  end
end