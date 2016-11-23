class TournamentsController < ApplicationController
  def index
    render(:index)
  end

  def json
    tournaments = Tournament.all
    render json: tournaments
  end
end
