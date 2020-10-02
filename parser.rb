require_relative 'lib/log_parser'
require_relative 'lib/page_counter'

log_parser = LogParser.new(ARGV[0])
pages_hash = log_parser.group_log_file
page_counter = PageCounter.new(pages_hash)

puts "Most Page Views"
page_counter.most_page_views
puts ""
puts "Most Unique Page Views"
page_counter.most_unique_page_views