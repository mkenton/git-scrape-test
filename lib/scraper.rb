require 'pry'
require 'nokogiri'
require 'open-uri'

user = "mkenton"
labs = ["phase-3-ruby-oo-self-count-sentences-lab"]
url = "https://github.com/#{user}/#{labs[0]}/tree/fis-wip"
html = URI.open(url)

doc = Nokogiri::HTML(html)
@num_commits = doc.search('//li//a//span//strong').text

@commit = doc.search('//relative-time')
@timedate_of_commit = @commit.first.attributes['datetime']
@date_of_commit = @commit.first.text

puts "number of commits: #{@num_commits}"
puts
puts "date/time of commit: #{@timedate_of_commit}"
puts
puts "Date of commit: #{@date_of_commit}"

lab_obj = {lab_name: labs[0], num_commits: @num_commits, timedate: @timedate_of_commit}
print lab_obj
# binding.pry


