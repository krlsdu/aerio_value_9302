#!/usr/bin/env ruby

require 'net/http'
require 'json'

# Class to solve challenge make by typeform
class Challenge
  attr_accessor :uri, :path

  def initialize(uri = 'www.aerial-valor-93012.appspot.com',
                 path = '/challenge')
    @uri = uri
    @path = path
  end

  def first_step(options = {})
    if options.empty?
      request = Net::HTTP.get_response(@uri, @path)
    else
      @path = ("#{@path}/#{options[:token]}/#{options[:sum]}")
      request = Net::HTTP.get_response(@uri, @path)
    end

    response = request.body
    JSON.parse(response)
  end

  def second_step(hash_json = {})
    parse = hash_json

    @token = parse['token']

    @values = parse['values']

    @sum = @values.inject(:+)

    { token: @token, sum: @sum }
  end
end
