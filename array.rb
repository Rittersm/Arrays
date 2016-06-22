#!/usr/bin/env ruby
require 'erb'

our_class = %w(Sean Marie Isaiah Daniel)

sentence = "Ruby is actually kind of fun once you get used to it."

movies = []
movies << {
  title: "Forest Gump",
  budget: 55.0,
  stars: ["Tom Hanks"]
}
movies << {
  title: "Star Wars",
  budget: 11.0,
  stars: ["Mark Hamill", "Harrison Ford"]
}
movies << {
  title: "Batman Begins",
  budget: 150.0,
  stars: ["Christian Bale", "Liam Neeson", "Michael Caine"]
}
movies << {
  title: "Titanic",
  budget: 200.0,
  stars: ["Kate Winslet", "Leonardo DiCaprio"]
}
movies << {
  title: "Inception",
  budget: 160.0,
  stars: ["Leonardo DiCaprio", "JGL"]
}

def how_many_words(text, num)
  word_count = []
  text.split(" ").each do |y|
    word_count << y if y.length == num
  end
  word_count.join(" ")
end

def four_words(text)
  how_many_words(text, 4)
end



# Class Array

short_names = []

our_class.each do |x|
  short_names << x if x.length < 5
end

# Sentence Array

word_count = how_many_words(sentence, 4)

# Movie Arrays

cheap_movies = []

movies.each do |m|
  if m[:budget] < 100
    cheap_movies << m[:title]
  end
end

leo_movies = []

movies.each do |l|
  if l[:stars].include? "Leonardo DiCaprio"
    leo_movies << l[:title]
  end
end


total_budget = 0

movies.each do |b|
  total_budget += b[:budget]
end


average_budget = total_budget / movies.length

new_file = File.open("./arraydisplay.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
