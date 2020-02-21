# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Josh")
Collection.create(collection_name: 'first collection', user_id: 1)
Song.create(title: 'first song', collection_id: 1, lyrics: 'first lyrics' )
Version.create(title: 'first version', song_id: 1)
