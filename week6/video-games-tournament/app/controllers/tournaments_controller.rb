class TournamentsController < ApplicationController
  def index
    render(:index)
  end

  def get
    tournaments = Tournament.all
    render json: tournaments
  end

  def post
    tournament = Tournament.create(tournament_params)
    # status: 201
    # render json: tournament
    render status: 201, json: tournament
  end

  def delete
    tournament = Tournament.find_by(id: params[:id])
    unless tournament
      render json: { error: 'tournament not found'},
                     status: 404
      return
    end
    tournament.destroy
    render json: tournament
  end

  private

  def tournament_params
    params.require(:tournament)
    .permit(:name)
  end
end
