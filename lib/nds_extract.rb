$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pry'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  directors_names = []
  name_index = 0
  while name_index < source.length do
    directors_names << source[name_index][:name]
    name_index += 1
  end
  directors_names
end

def total_gross(source)
 total_gross = 0
 array_index = 0
 while array_index < list_of_directors(source).length
 total_gross += directors_totals(source)[list_of_directors(source)[array_index]]
 array_index += 1
 end
 total_gross
end


