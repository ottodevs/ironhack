require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
