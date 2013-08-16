require 'spec_helper'
 
describe Movie do
  describe 'find movies by director' do
    before :each do
      Movie.create({:title => 'Blade Runner', :director => 'Ridley Scott'})
      Movie.create({:title => 'Alien', :director => 'Ridley Scott'})
      Movie.create({:title => 'THX-1138'})
      Movie.create({:title => 'Star Wars', :director => 'George Lucas'})
    end
   
  	it 'should return a list of movies by the director of the movie provided' do
      @movies = Movie.find_movies_by_director(Movie.find('1'))
      @movies.each do |movie|
        movie.director.should == 'Ridley Scott'
      end
    end

    it 'should handle movies with no director specified' do
      @movies = Movie.find_movies_by_director(Movie.find('3'))
      @movies.should == []
    end
  end

# it 'should call Movie with a director string' do
##      Movie.should_receive(:find).with(hash_including :director => 'Ridley Scott')
#     Movie.find_movies_by_director(Movie.find_by_title('Alien'))
#    end

#  require ’spec_helper’ 
##describe Movie do 
# describe ’searching Tmdb by keyword’ do  
#it ’should call Tmdb with title keywords’ do 
#TmdbMovie.should_receive(:find).with(hash_including :title => ’Inception’) 
#Movie.find_in_tmdb(’Inception’) 
#end
#end
#end

  #describe 'searching TMDb' do
  #  it 'should call the model method that performs TMDb search'
  #  it 'should select the Search Results template for rendering'
  #  it 'should make the TMDb search results available to that template'
  #end

end