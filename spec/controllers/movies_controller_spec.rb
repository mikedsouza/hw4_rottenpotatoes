require 'spec_helper'
 
describe MoviesController do
  describe 'find movies by same director' do
    before :each do
      @fake_results = [mock('movie1'), mock('movie2')]
    end
  	it 'should call the model method that searches for movies by director' do
      Movie.should_receive(:find_movies_by_director).with('1').and_return(@fake_results)
      get :search_by_director, {:id => '1'}
    end
  	it 'should select the Director Search Results template for rendering' do
      Movie.stub(:find_movies_by_director).and_return(@fake_results)
      get :search_by_director, {:id => '1'}
      response.should render_template('search_by_director')
    end
  	it 'should make the search by director results available to that template' do
      Movie.stub(:find_movies_by_director).and_return(@fake_results)
      get :search_by_director, {:id => '1'}
      assigns(:movies).should == @fake_results
    end
  end

  #describe 'searching TMDb' do
  #  it 'should call the model method that performs TMDb search'
  #  it 'should select the Search Results template for rendering'
  #  it 'should make the TMDb search results available to that template'
  #end

end