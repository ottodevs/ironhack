require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before(:each) do
    assign(:movies, [
      Movie.create!(),
      Movie.create!()
    ])
  end

  it "renders a list of movies" do
    render
  end
end
