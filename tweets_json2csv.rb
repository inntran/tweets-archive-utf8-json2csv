#!/usr/bin/env ruby
# encoding: UTF-8
require 'json'
require 'csv'

dir_to_archive = ARGV.shift
original_js = Dir.glob("#{dir_to_archive}/data/js/tweets/*.js")

CSV.open("./my_tweets_archive_natural.csv", "wb") do |csv|
  csv << ["推文ID","推文内容","创建时间"]
  original_js.each do |js_file|
    pre_js_string = File.read(js_file)
    json_string = pre_js_string.split("\n")[1..-1].join
    tweets = JSON.parse json_string
    tweets.reverse.each do |tweet|
      id = tweet["id_str"]
      text = tweet["text"]
      pre_created_at = tweet["created_at"]
      created_at = DateTime.strptime(pre_created_at, '%a %b %d %H:%M:%S %z %Y').strftime("%F %T GMT")
      csv << [id, text, created_at]
    end
  end
end

CSV.open("./my_tweets_archive_timeline.csv", "wb") do |csv|
  csv << ["推文ID","推文内容","创建时间"]
  original_js.reverse.each do |js_file|
    pre_js_string = File.read(js_file)
    json_string = pre_js_string.split("\n")[1..-1].join
    tweets = JSON.parse json_string
    tweets.each do |tweet|
      id = tweet["id_str"]
      text = tweet["text"]
      pre_created_at = tweet["created_at"]
      created_at = DateTime.strptime(pre_created_at, '%a %b %d %H:%M:%S %z %Y').strftime("%F %T GMT")
      csv << [id, text, created_at]
    end
  end
end