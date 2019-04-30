require_relative "./scraper.rb"
require_relative "./topic.rb"
require_relative "./article.rb"
require 'nokogiri'
require 'open-uri'
require 'launchy'
require 'pry'

Class Cli
    def call_user
        user_input = nil
        while user_input != "exit"
            puts "Welcome, it looks like you are looking for some Good News!"
            puts "To see Good News topics, type 'topics'."
            puts "To quit, type 'exit'."
            puts "Please enter your choice now."

            user_input = gets.downcase.chomp

            case user_input
            when 'topics'
                display_topics
            when 'exit'
                puts "See you next time!"
                exit
            end
        end
    end

    def display_topics
        counter = 1
        Topic.all.each do |topic|
            puts "#{counter}. #{topic.name}"
            counter += 1
        end
        while user_input != "exit"
            puts "Please enter the number of the topic to see a list of articles."
            puts "Or type 'exit' to quit."
            
            user_input = gets.chomp

            case user_input
            when (1..Topic.all.length).include?(user_input.to_i)
                display_articles(user_input)
            when "exit"
                puts "See you next time!"
                exit
            end
        end
    end

    def display_articles(input)
        counter = 1
        Topic.all[input-1].articles.each do |article|
            puts "#{counter}. #{article.name}"
            counter +=1
        end
        while user_input != "exit"
            puts "Please enter the number of the article to be taken to its page."
            puts "Or type 'exit' to quit."
            
            user_input = gets.chomp

            case user_input
            when (1..Topic.all[input-1].articles.length).include?(user_input.to_i)
                puts "Hold onto your seat, we are sending you to some Good News!"

            when "exit"
                puts "See you next time!"
                exit
            end
        end

    end

    def exit

    end



end