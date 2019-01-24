# ExBrain
[![Ruby](https://img.shields.io/badge/Ruby-2.5.3-red.svg)](https://docs.ruby-lang.org/ja/2.5.0/doc/index.html)
[![Ruby on Rails](https://img.shields.io/badge/Ruby%20on%20Rails-5.2.2-red.svg)](https://guides.rubyonrails.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-10.5-blue.svg)](https://www.postgresql.org/)

DIVE INTO CODEの卒業課題です。

## コンセプト

- 読了した書籍の内容をスキマ時間におさらい!
- 問題作成で、書籍内容の編集およびアウトプットが可能!

## 概要

- ユーザーが読み終えた書籍を登録・一覧できる(読了した本のポートフォリオ)　=> ツンドクの軽減
- ユーザーが読み終えた書籍の内容から問題を作成できる(情報の編集・知識のアウトプット) => 知識の定着
- ユーザーが問題を解くことができる(知識の再インプット) => 知識の定着
- 他のユーザーをフォローできる(他者のポートフォリオ閲覧) => 面白そうな未読本の発見
- 他のユーザーが作成した問題を解くことができる(知識の再インプット) => 他者視点での学習

## 機能一覧

1.ログイン
 - []SNSログイン機能(ominiauth使用)
 - []ログインによる機能制限(devise使用)

2.画像
  - []画像投稿機能(ユーザーアイコン、書籍アイコン)

3.書籍
 - []書籍情報の登録機能
 - []書籍一覧の表示機能(kaminari使用)
 - []書籍の編集機能
 - []書籍の削除機能

4.問題
- []問題の登録機能
- []問題の一覧表示機能
- []問題の編集機能
- []問題の削除機能
- []問題の解答機能(Ajax使用)

## 仕様

- [カタログ設計](https://docs.google.com/spreadsheets/d/11_zs59nDlXGr9un59Kv_nKRELJglrdHiLZXPHKaABAM/edit#gid=0)
- [テーブル定義](https://docs.google.com/spreadsheets/d/11_zs59nDlXGr9un59Kv_nKRELJglrdHiLZXPHKaABAM/edit#gid=1614793316)
- [ER図](https://drive.google.com/file/d/1RRlYxL8iPtvyMmHT9rFFHaNVyYrRjT1u/view)
- [画面遷移図](https://docs.google.com/spreadsheets/d/11_zs59nDlXGr9un59Kv_nKRELJglrdHiLZXPHKaABAM/edit#gid=629326844)
- [ワイヤーフレーム](https://docs.google.com/spreadsheets/d/11_zs59nDlXGr9un59Kv_nKRELJglrdHiLZXPHKaABAM/edit#gid=1669746727)

## 使用予定gem

- gem 'devise'
- gem 'omniauth'
- gem 'omniauth-twitter'
- gem 'omniauth-facebook'
- gem 'omniauth-google-oauth2'
- gem 'kaminari'
- gem 'kaminari-bootstrap'
- gem "font-awesome-rails"
- gem 'carrierwave'
- gem 'mini_magick'