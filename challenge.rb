require 'net/http'
require 'json'

uri = URI('http://aerial-valor-93012.appspot.com/challenge')

request = Net::HTTP.get_response(uri)

response = request.body

my_hash = JSON.parse(response)

token = my_hash["token"]
values = my_hash["values"]

sum = values.inject(:+)

url_solve = URI("http://aerial-valor-93012.appspot.com/challenge/#{token}/#{sum}")

request_solve = Net::HTTP.get_response(url_solve)

response_solve = request_solve.body

puts "Initial data"
puts " "
puts uri
puts "Token: #{token} "
puts "Values #{values} "

puts " "

puts "Problem solve"
puts " "
puts url_solve
puts "Sum: #{sum}"
puts "Resolve challenge: #{response_solve}"
