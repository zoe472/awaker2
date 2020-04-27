# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

we = Category.create(name: "メンズ")
other = Category.create(name: "レディース")
we2 = Category.create(name: "キッズ")
we3 = Category.create(name: "ベビー")
noselect = Category.create(name: "その他")

Brand.create(name: "Awaker")
Brand.create(name: "ダミーブランド１")
Brand.create(name: "その他")