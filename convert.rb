require 'nokogiri'
require './item'

Dir.glob('**/*.html').each do |html_file|
  target_file_path = html_file.gsub('source', 'output')
  page             = Nokogiri::HTML(open(html_file))

  # get what I want
  target_content   = "<!DOCTYPE html><html>
<head><title></title>
<meta charset='utf-8'/><meta name='viewport' content='width=device-width, initial-scale=1'/>
<link rel='stylesheet' href='assets/css/main.css'/></head><body>"

  target_content += page.css("#main").to_html()
  target_content += "</body></html>"

  count = 0
  puts "start to write #{count+=1} and #{target_file_path}"
  FileUtils.mkdir_p File.dirname(target_file_path)
  begin
    file = File.open(target_file_path, "w")
    file.write(target_content)
  rescue IOError => e
    #some error occur, dir not writable etc.
    puts e.message
  ensure
    file.close unless file.nil?
  end

end