# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

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