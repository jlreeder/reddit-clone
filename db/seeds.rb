# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Sub.destroy_all
Post.destroy_all

u1 = User.create!(username: "Parzival", password:"12345678")
u2 = User.create!(username: "Art3mis", password:"12345678")
u3 = User.create!(username: "Aech", password:"12345678")

s1 = Sub.create!(title: "ReadyPlayerOne", description: "an awesome book", moderator_id: u1.id)
s1 = Sub.create!(title: "MysteryHouse",
                 description: "Best graphics ever!!",
                 moderator_id: u2.id)

p1 = Post.create!(title: "Halliday Hunt",
                  content: "The Halliday Hunt is on!",
                  sub_id: s1.id,
                  author_id: u1.id)
