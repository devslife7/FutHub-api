class ApiCallsController < ApplicationController
  skip_before_action :authorized, only: [:fixtures_by_date]

  def fixtures_by_date
    url = "https://api-football-v1.p.rapidapi.com/v3/fixtures?date=#{params[:fetchDate]}"
    headers = {"X-RapidAPI-Key": ENV['API_KEY']}
    response = RestClient::Request.execute(
      :url => url,
      :method => :get,
      :headers => headers,
      :verify_ssl => false
    )
    data = JSON.parse( response )

    if data
      matches = data["response"]
      
      # popular_league_ids = [2771, 2833, 1264, 2790, 2755, 2857, 2777, 2664, 2656] old
      popular_league_ids = [140, 253, 39, 78, 135, 848, 61, 262, 2]
      filteredMatches = matches.select {|match| popular_league_ids.include?(match["league"]["id"])}
      
      render json: filteredMatches, status: :ok
    else
      render json: data.errors, status: :unprocessable_entity
    end
  end
  
end
