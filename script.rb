#my_songs_with_folder
require 'mechanize'
require 'nokogiri'
require 'rubygems'
require 'open-uri'
require 'hpricot'
require 'byebug'
require 'mp3info'

PATH = "/home/cis/Downloads/"

doc = Nokogiri::HTML(open('http://www.songspk.kim/indian_movie'))
agent = Mechanize.new
page = agent.get "http://www.songspk.kim/indian_movie"
column = doc.css(".column")
links = column.css("a")
links.each do |link|
  puts link['href']
  Mechanize::Page::Link.new(link['href'], agent, page).click

  doc = Nokogiri::HTML(open(link['href']))
  agent = Mechanize.new
  page = agent.get link['href']
  column = doc.css(".list")
  links = column.css("a")
  links.each do |link|
    puts link['href']
    Mechanize::Page::Link.new(link['href'], agent, page).click

    doc = Nokogiri::HTML(open(link['href']))
    agent = Mechanize.new
    page = agent.get link['href']
    column = doc.css(".songs-bitrate-1")
    links = column.css("a")
    links.each do |link|
      counter = 0
        begin
          song = open(link['href'])
          file = Mp3Info.open(song.path)
          if Dir.exists?(PATH + '/'+ file.tag['album']) == false
            Dir.mkdir PATH + '/'+ file.tag['album']
          end
          FILE_PATH = PATH + '/'+ file.tag['album']+ '/' + file.tag['title'] + '.mp3'
          File.open(FILE_PATH, "w"){|file|
          file.write(open(song.path).read)
          file.close
          }
          file.close
          rescue
          if counter < 5
            counter += 1
            puts counter.to_s + " " + link
            retry
          end
        end
    end
  end
end



#my_songs_filmname

require 'mechanize'
require 'nokogiri'
require 'rubygems'
require 'open-uri'
require 'hpricot'
require 'byebug'
require 'mp3info'
array_links = Array.new
 count = 0
 PATH = "/home/cis/Downloads/"
doc = Nokogiri::HTML(open('http://www.songspk.kim/indian_movie'))
agent = Mechanize.new
page = agent.get "http://www.songspk.kim/indian_movie"
column = doc.css(".column")
links = column.css("a")
links.each do |link|
  byebug
  puts link['href']
  Mechanize::Page::Link.new(link['href'], agent, page).click
    doc = Nokogiri::HTML(open(link['href']))
    agent = Mechanize.new
    page = agent.get link['href']
    column = doc.css(".list")
    links = column.css("a")
    links.each do |link|
    puts link['href']
    Mechanize::Page::Link.new(link['href'], agent, page).click
      doc = Nokogiri::HTML(open(link['href']))
      agent = Mechanize.new
      page = agent.get link['href']
      column = doc.css(".songs-bitrate-1")
      links = column.css("a")
      links.each do |link|

      array_links[count] = link['href']
      count = count + 1

      end
      break
    end
    break
  end

  array_links.each do |song_url|
    counter = 0
    begin
    song = open(song_url)
    file = Mp3Info.open(song.path)
    FILE_PATH = PATH+file.tag['title'] + '.mp3'
    File.open(FILE_PATH, "w"){|file|
      file.write(open(song.path).read)
      file.close
    }
    file.close
  rescue
    if counter < 5
      counter += 1
      puts counter.to_s + " " + song_url
    retry
  end
  end
  end


  #my_songs_initial

  require 'mechanize'
require 'nokogiri'
require 'rubygems'
require 'open-uri'
require 'hpricot'
require 'byebug'
require 'mp3info'

PATH = "/home/cis/Downloads/"
doc = Nokogiri::HTML(open('http://www.songspk.kim/indian_movie'))
agent = Mechanize.new
page = agent.get "http://www.songspk.kim/indian_movie"
column = doc.css(".column")
links = column.css("a")
links.each do |link|
  puts link['href']
  Mechanize::Page::Link.new(link['href'], agent, page).click
  doc = Nokogiri::HTML(open(link['href']))
  agent = Mechanize.new
  page = agent.get link['href']
  column = doc.css(".list")
  links = column.css("a")
  links.each do |link|
    puts link['href']
    Mechanize::Page::Link.new(link['href'], agent, page).click
    doc = Nokogiri::HTML(open(link['href']))
    agent = Mechanize.new
    page = agent.get link['href']
    column = doc.css(".songs-bitrate-1")
    links = column.css("a")
    links.each do |link|
      counter = 0
      begin
        song = open(link['href'])
        file = Mp3Info.open(song.path)
        FILE_PATH = PATH+file.tag['title'] + '.mp3'
        File.open(FILE_PATH, "w"){|file|
        file.write(open(song.path).read)
        file.close
        }
        file.close
      rescue
        if counter < 5
          counter += 1
          puts counter.to_s + " " + link
          retry
        end
      end
    end
  end
end

