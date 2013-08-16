class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.find_movies_by_director(id)
  	@director = Movie.find(id).director
    unless @director.empty?
  	  Movie.find_all_by_director(@director)
    else
      []
    end
  end

  #def find_movies_by_director(movie)
    #pass the instance method the id of the movie... why? why not. 
  #end
end
