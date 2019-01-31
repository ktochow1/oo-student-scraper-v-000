require 'open-uri'
require 'pry'


class Scraper

  def self.scrape_index_page(index_url)

    index_page = Nokogiri::HTML(open(index_url))
    student_arr = []
    index_page.css(".roster-cards-container").each do |student|
      student.css(".student-card a").each do |info|
        student_name = info.css(".student-name").text
        student_location = info.css(".student-location").text
        student_pro_url = "#{info.attr('href')}"
        
        student_arr << {:name => student_name, :location => student_location, :profile_url => student_pro_url}
      end 
    end
    student_arr
  end

  
  def self.scrape_profile_page(profile_url)
    scrape_page = Nokogiri::HTML(open(profile_url))
    profile_hash = {}
    profile_page = scrape_page.css(".roster-cards-container a").collect{|icon| icon.attribute("href").value}
                                  #tried using ".student-card" didn't work
     
    profile_page.each do |link| #("div.studen-card a").each do |link|
      # student.css("a").each do |link|
        if link.include?("twitter")
         profile_hash[:twitter] = link
          
         
          elsif link.include?("linkedin")
            profile_hash[:linkedin] = link 
          
          elsif link.include?("github")
            profile_hash[:github] = link
          
          elsif link.include?(".com")
            profile_hash[:blog] = link
            
          elsif link.include?("profile-quote")
          profile_hash[:profile_quote] = link 
          
          elsif link.include?("bio")
          profile_hash[:bio] = link
        binding.pry  
      end
      
    end 
  # profile_hash[:profile_quote] = scrape_page.css(".profile-quote").text 
  # profile_hash[:bio] = scrape_page.css("div.description-holder p").text
  #these two above show up, other than that they don't..can't even hit pry
  profile_hash
  end

end


# def self.scrape_profile_page(profile_url)
#     page = Nokogiri::HTML(open(profile_url))
#     student = {}
#     container = page.css(".social-icon-container a").collect{|icon| icon.attribute("href").value}
#     container.each do |link|
#       if link.include?("twitter")
#         student[:twitter] = link
#       elsif link.include?("linkedin")
#         student[:linkedin] = link
#       elsif link.include?("github")
#         student[:github] = link
#       elsif link.include?(".com")
#         student[:blog] = link
#       end
#     end
#     student[:profile_quote] = page.css(".profile-quote").text
#     student[:bio] = page.css("div.description-holder p").text
#     student
#   end
# end

# iterate through the container, collecting the twitter/ blog/ linkedin info
# ... 

# if link.include?("twitter")
#           student[:twitter] = link
#         elsif link.include?("linkedin")
#           student[:linkedin] = link

# 1. Scrapped page with nokogiri. 2. Made a new, empty hash. 3. To add keys/ values to the hash, I iterated through the container if the value contains mention of linkedin/ github/ etc.
# end

