class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :league_id, :name, :type, :country, :season, :season_start, :season_end, :logo, :flag, :standings, :is_current, :is_favorite
end
