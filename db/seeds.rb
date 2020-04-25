# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

we = Category.create(name: "Awaker")
other = Category.create(name: "ダミーブランド1")
noselect = Category.create(name: "その他")

we_mens = we.children.create(name: "メンズ")
we_lady = we.children.create(name: "レディース")
we_kids = we.children.create(name: "キッズ")
we_baby = we.children.create(name: "ベビー")

other_item1 = other.children.create(name: "化粧品")
other_item1 = other.children.create(name: "生活雑貨")