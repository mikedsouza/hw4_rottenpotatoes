# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.

    Movie.create(:title => movie[:title], :rating => movie[:rating], :release_date => movie[:release_date], :director => movie[:director])

  end
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |movie, director|
  @movie = Movie.find_by_title(movie)
  director.should == @movie.director
end

#When /^(?:|I )follow "Find Movies With (t|The )?Same Director"$/ do |link|
#  step ("I follow "Find Movies With Same Director")
#  step %Q(I press "ratings_#{button.downcase}")
#end
