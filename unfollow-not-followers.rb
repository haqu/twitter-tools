#!/usr/bin/env ruby

require 'rubygems'
require 'yaml'
require 'chirpy'

config = YAML::load(File.open('config.yaml'))
username = config['username']
password = config['password']

puts
puts "[*] Unfollowing those who don't follow you back"
puts "username : #{username}"

chirpy = Chirpy.new(username,password)

followers = []
chirpy.followers.search('user').each do |u|
  name = u.at('screen_name').innerHTML
  followers << name
end

targets = []
chirpy.friends.search('user').each do |u|
  name = u.at('screen_name').innerHTML
  if not followers.include?(name)
    targets << name
  end
end

puts "targets  : #{targets.count}"
puts

count = 0
targets.each do |t|
  chirpy.destroy_friendship(t)
  count += 1
  puts "%-3d %s" % [count,t]
end

puts

num_friends = chirpy.friends.search('user').length
puts "#{username} follows #{num_friends} people (#{count} removed)"
puts
