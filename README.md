# README

## アプリ名
MITETE
<img src="***https://github.com/zoe472/awaker2/blob/master/app/assets/images/111.png***" width="50px">

## アプリ概要

#### ・投稿型広告アプリ、画像や文章を投稿することで簡単な商品紹介ページの作成が可能
#### ・ブランド、タグ、キーワードによる検索が可能
#### ・自分の投稿、お気に入りした投稿はマイページから確認可能
#### ・マイページからブランド名を申請し、管理ユーザーで許可することでマイブランドをブランドのカテゴリーに追加可能

## 本番環境(デプロイ先　テストアカウント＆ID)

URL **https://awaker2.herokuapp.com/**
テストアカウント: email 「iii@gmail.com」
             pass  「iiiiiiiiii」

## 制作意図

ネットでの発信力が弱いファッションブランドの広告がわりになればと思い作成しました。
ツイッターやインスタグラムでは他の投稿に埋もれてしまう、
自分の投稿までたどり着いてもらえないと言った問題を解消すべく
通常の検索に加え、ブランド単位の検索機能を実装。

また、誰でも投稿可能なためそのブランドのユーザーも投稿を行うことができます。
各ユーザーが自分の着こなしを投稿することで、一つのアイテムでも多種多様な広告が存在することになり
ブランド主も自分で全ての広告を用意する必要がないため、その分の費用を削減することができます。

そして複数のブランドの投稿が見られるため、サイトの訪問者が他の投稿を見て別のブランドをしるという
ユーザーとブランドの中継役になることのできるサイトを目指し作成いたしました。



* ...
## users テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|image|string|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :tweets
- has_many :comments

## tweets テーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|text|text|
|category_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belomgs_to :category
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|tweets_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :tweets

## category テーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|url|string|null: false|
|image|string|null: false|
### Association
- has_one :tweets
