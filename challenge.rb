#!/usr/bin/env ruby

require 'net/http'
require 'json'

# Class to get the request from service Challenge
class DogFavoritFood
  attr_accessor :path
  def initialize
    @path = '/challenge'
    @uri = 'www.aerial-valor-93012.appspot.com'
  end

  def request_token_and_values(options = {})
    unless options.empty?
      @path = ("#{@path}/#{options[:token]}/#{options[:sum]}")
    end
    request = Net::HTTP.get_response(@uri, @path)
    request.body
  end
end

# Class to parse the response the request made to service Challenge
class ParseBodyRequest
  attr_accessor :hash_json

  def parse_request(hash_json)
    parse = JSON.parse(hash_json)

    @token = parse['token']

    @values = parse['values']

    @sum = @values.inject(:+)

    { token: @token, sum: @sum }
  end
end

dog = DogFavoritFood.new
parse = ParseBodyRequest.new

puts one = dog.request_token_and_values
two = parse.parse_request(one)
puts dog.request_token_and_values(two)
