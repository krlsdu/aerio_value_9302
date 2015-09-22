#!/usr/bin/env ruby
require 'net/http'
require 'json'

class Challenge
  attr_accessor :uri, :path

  def initialize (uri='www.aerial-valor-93012.appspot.com', path='/challenge')
    @uri = uri
    @path = path
  end

  def first_step(options={})
    if options.empty?
      request = Net::HTTP.get_response(@uri,@path)
      request.body
    else
      @path=("#{@path}/#{options[:token]}/#{options[:sum]}")
      request = Net::HTTP.get_response(@uri,@path)
      request.body
    end

  end

  def second_step(hash_json)

    parse = JSON.parse(hash_json)

    @token=parse["token"]

    @values=parse["values"]

    @sum = @values.inject(:+)

    hash = {token: @token, sum: @sum}

  end

end
