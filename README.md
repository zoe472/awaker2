# README

## アプリ名
##### MITETE
<img src="https://github.com/zoe472/awaker2/blob/master/app/assets/images/111.png" width="200px">

## :green_book:アプリ概要

#### ・投稿型広告アプリ、画像や文章を投稿することで簡単な商品紹介ページの作成が可能
#### ・ブランド、タグ、キーワードによる検索が可能
#### ・自分の投稿、お気に入りした投稿はマイページから確認可能
#### ・マイページからブランド名を申請し、管理ユーザーで許可することでマイブランドをブランドのカテゴリーに追加可能

## :globe_with_meridians:本番環境(デプロイ先　テストアカウント＆ID)

URL **https://awaker2.herokuapp.com/**
テストアカウント: email 「iii@gmail.com」
             pass  「iiiiiiiiii」

## :blue_book:制作意図

ネットでの発信力が弱いファッションブランドの広告がわりになればと思い作成しました。
ツイッターやインスタグラムでは他の投稿に埋もれてしまう、
自分の投稿までたどり着いてもらえないと言った問題を解消すべく
通常の検索に加え、ブランド単位の検索機能を実装。

また、誰でも投稿可能なためそのブランドのユーザーも投稿を行うことができます。
各ユーザーが自分の着こなしを投稿することで、一つのアイテムでも多種多様な広告が存在することになり
ブランド主も自分で全ての広告を用意する必要がないため、その分の費用を削減することができます。

そして複数のブランドの投稿が見られるため、サイトの訪問者が他の投稿を見て別のブランドを知るという
ユーザーとブランドの中継役になることのできるサイトを目指し作成いたしました。


## DB設計

### brands テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|
|user_id|interger|
### Association
- belongs_to :quest
- has_many :tweets
### categories テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
has_many :tweets

### likes テーブル

|Column|Type|Options|
|------|----|-------|
|tweet_id|bigint|
|user_id|bigint|

### Association
- belongs_to :tweet
- belongs_to :user

### quests テーブル

|Column|Type|Options|
|------|----|-------|
|brandname|string|
|user_id|interger|

### Association
- has_one :brand

### tags テーブル

|Column|Type|Options|
|------|----|-------|
|brandname|string|
|user_id|interger|

### Association
- has_many :tweet_tag_relations, dependent: :destroy
- has_many :tweets, through: :tweet_tag_relations

### toukouimages テーブル

|Column|Type|Options|
|------|----|-------|
|image|text|
|user_id|interger|

### Association
- belongs_to :tweet

### users テーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|
|admin|boolean|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :tweets
- has_many :likes, dependent: :destroy
- has_many :liked_tweets, through: :likes, source: :tweet


## tweets テーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|text|string|
|catchcopy|string|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :toukouimages, dependent: :destroy
- accepts_nested_attributes_for :toukouimages, allow_destroy: true
- has_many :tweet_tag_relations, dependent: :destroy
- has_many :tags, through: :tweet_tag_relations
- has_many :likes, dependent: :destroy
- has_many :liked_users, through: :likes, source: :user



