class StatsController < ApplicationController
  helper_method :sort_column, :sort_direction, :where_column, :where_condition

  def show
    @games = current_user.games.where(where_column => where_condition).order(sort_column + ' ' + sort_direction)
  	@profit = 0
  	
  	@games.each do |game|
  		@profit += (game.winnings - game.buyin)
	end

  end

  private

  def sort_column
	Game.column_names.include?(params[:sort]) ? params[:sort] : "played"
  end

  def sort_direction
  	%w(asc desc).include?(params[:direction]) ? params[:direction] : "asc"
  end

  def where_column
    Game.column_names.include?(params[:where_key]) ? params[:where_key] : :winnings
  end

  def where_condition
    params[:where_value] ? params[:where_value] : [0..10000]
  end
end
