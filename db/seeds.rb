# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.first_or_create([
   { id: 1, value: 'ブログ' },
   { id: 2, value: '開発' },
   { id: 3, value: 'Vue.js' },
   { id: 4, value: 'Ruby' },
   { id: 5, value: 'Rails' },
   { id: 6, value: 'Python' },
   { id: 7, value: 'JavaScript' },
   { id: 8, value: 'jQuery' },
   { id: 9, value: 'HTML' },
   { id: 10, value: 'CSS' },
   { id: 11, value: 'AWS' },
])