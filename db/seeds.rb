# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Jump.destroy_all
Picture.destroy_all
Video.destroy_all

one = Jump.create(
  jump_number: 158,
  date: "2013-09-15",
  location: "Sky's the limit",
  freefall_time: 63,
  equipment: "Talon 2, Saber150",
  aircraft: "Caravan",
  notes: "9 way track, sunset load. TJ Maglia was leading.",
  exit_altitude: 13500
  )
Picture.create(
  name: "TJ in the lead",
  picture_url: "https://scontent-b-mia.xx.fbcdn.net/hphotos-ash4/t31/1267558_10200715609192813_1921312878_o.jpg",
  jump: one
  )
Video.create(
  name: "jump number 158",
  video_url: "http://www.youtube.com/embed/-uIv8t9t6EU",
  jump: one
  )