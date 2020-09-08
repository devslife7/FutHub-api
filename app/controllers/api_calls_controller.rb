class ApiCallsController < ApplicationController
  skip_before_action :authorized, only: [:fixtures_by_date]

  def fixtures_by_date
    headers = {"X-RapidAPI-Key": "f1b01111bamsh60c54da50b0a770p1059c7jsn4c82133f9b38"}
    # byebug
    data = JSON.parse(RestClient.get("https://api-football-v1.p.rapidapi.com/v2/fixtures/date/2020-09-06", headers))

    if data
      render json: data["api"]["fixtures"], status: :ok
    else
      render json: data.errors, status: :unprocessable_entity
    end
  end
  
end
