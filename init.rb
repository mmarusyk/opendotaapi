require_relative 'lib/odapi'

# Отримати масив героїв
response = ODApi::ODApi.heroes

# Вивести
response.each do |hero|
  puts hero
end

# Отримати масив матчів героя 1
response = ODApi::ODApi.matches(id: 1)

# Вивести
response.each do |match|
  puts match
end