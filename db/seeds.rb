# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
a1 = Artist.create(name: "My Artist1", bio: "My artist bio1")
a2 = Artist.create(name: "My Artist2", bio: "My artist bio2")
g1 = Genre.create(name: "Funk")
g2 = Genre.create(name: "Jazz")
Song.create(name: "My Song1", artist_id: a1.id, genre_id: g1.id)
Song.create(name: "My Song1.1", artist_id: a1.id, genre_id: g2.id)
Song.create(name: "My Song2", artist_id: a2.id, genre_id: g2.id)