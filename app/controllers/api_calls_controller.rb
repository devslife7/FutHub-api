class ApiCallsController < ApplicationController
  skip_before_action :authorized, only: [:fixtures_by_date]

  def fixtures_by_date
    headers = {"X-RapidAPI-Key": ENV['API_KEY']}
    data = JSON.parse(
      # RestClient.get("https://api-football-v1.p.rapidapi.com/v2/fixtures/date/#{params[:fetchDate]}", headers)
      RestClient.get("https://api-football-v1.p.rapidapi.com/v3/fixtures?date=#{params[:fetchDate]}", headers)
      # RestClient.get("https://api-football-v1.p.rapidapi.com/v3/fixtures?date=2021-07-26", headers)
      
    )

    if data
      # matches = data["api"]["fixtures"]
      matches = data["response"]
      
      # popular_league_ids = [2771, 2833, 1264, 2790, 2755, 2857, 2777, 2664, 2656]
      popular_league_ids = [140, 253, 39, 78, 135, 848, 61, 262, 2]
      filteredMatches = matches.select {|match| popular_league_ids.include?(match["league"]["id"])}
      
      render json: filteredMatches, status: :ok
    else
      render json: data.errors, status: :unprocessable_entity
    end
  end
  
end
