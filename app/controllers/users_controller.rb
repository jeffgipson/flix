class UsersController < ApplicationController
  def addmovie
    @addmovieid = params[:id]
    current_user.top_movies << @addmovieid
    current_user.save
  end

  def top_movies
    # Get Single Movie
    byebug
          @base_url = "https://api.themoviedb.org/3"
          @key = "2517708c8fb4b77b5994719f8007a06d"

           @single_movie_id_number = current_user.top_movies[0]
           endpoint = "movie/#{@single_movie_id_number}"
           api_link = "#{@base_url}/#{endpoint}?api_key=#{@key}&language=en-US"
           require "http"
           @details = HTTP.get(api_link).body
         end
end
