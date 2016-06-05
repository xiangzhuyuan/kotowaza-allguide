require 'nokogiri'
require './item'

count = 0


Dir.glob('output/**/*.html').each do |html_file|
  target_file_path = html_file
  page             = Nokogiri::HTML(open(html_file))

  # get what I want

  page.css("#search2").remove()
  page.search("script").remove()
  if page.search("h3.box").length == 1
    page.search("h3.box")[0].remove()
  end
  if page.search("h3.box")[1]
    page.search("h3.box")[1].remove()
  end
  page.search("div.foot_ad").remove()
  target_content =page.to_html().gsub(" width=\"60\" valign=\"top\"", "")

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