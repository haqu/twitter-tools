#!/usr/bin/env ruby

query = ARGV[0] || exit
query = "\"#{query}\"" # EXACT match

require 'rubygems'
require 'yaml'
require 'chirpy'

config = YAML::load(File.open('config.yaml'))
username = config['username']
password = config['password']

puts
puts "[*] Following users from twitter search"
puts "username: "+username
puts "search query: "+query
puts

users = []
Chirpy.search(query).search('author').each do |a|
  users << a.at('uri').innerHTML.split('/').last
end

chirpy = Chirpy.new(username,password)

friends = []
chirpy.friends.search('user').each do |u|
  friends << u.at('screen_name').innerHTML
end

users -= friends
users.delete(username)
users.uniq!

puts "targets"

count_added = 0
users.each do |u|
  chirpy.create_friendship(u)
  count_added += 1
  puts "%-3d %s" % [count_added,u]
end
puts

count_friends = chirpy.friends.search('user').count
puts "#{username} follows #{count_friends} people (#{count_added} added)"

puts
