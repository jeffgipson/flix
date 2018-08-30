class MoviesController < ApplicationController
  def index
# Get Movies
    @query = ""
    if params[:keyword].present?
    @query= [params[:keyword]]
    else
    @query = ["a"]
    end
    @query_string = @query[0]
    @query = @query.to_s.gsub(/\s/, '%20')
    base_url = "https://api.themoviedb.org/3"
    endpoint = "search/movie"
    @key = "2517708c8fb4b77b5994719f8007a06d"
    api_url = "#{base_url}/#{endpoint}?api_key=#{@key}&query=#{@query}&language=en-US&include_adult=false"
    require "http"
    @response = HTTP.get(api_url).body
#get genre array
    genre_api_url = "https://api.themoviedb.org/3/genre/movie/list?api_key=2517708c8fb4b77b5994719f8007a06d&language=en-US"
    @genre = JSON.parse(HTTP.get(genre_api_url).body)
  end

  def single

    @base_url = "https://api.themoviedb.org/3"
    @key = "2517708c8fb4b77b5994719f8007a06d"

    #Get Credits
     @title= [params[:title]]
     @single_movie_id= [params[:id]]
     @single_movie_id = @single_movie_id[0]
     endpoint = "movie/#{@single_movie_id}/credits"
     api_url = "#{@base_url}/#{endpoint}?api_key=#{@key}&query=#{@query}"
     require "http"
     @cast = HTTP.get(api_url).body

 #Get Video Link
     endpoint = "movie/#{@single_movie_id}/videos"
     api_uri = "#{@base_url}/#{endpoint}?api_key=#{@key}&query=#{@query}&language=en-US"
     require "http"
     @videos = HTTP.get(api_uri).body

 # Get Single Movie

        @single_movie_id_number = [params[:id]]
        @single_movie_id_number = @single_movie_id_number[0]
        endpoint = "movie/#{@single_movie_id_number}"
        api_link = "#{@base_url}/#{endpoint}?api_key=#{@key}&language=en-US"
        require "http"
        @details = HTTP.get(api_link).body


#Get Similar Movies
      endpoint = "movie/#{@single_movie_id}/similar"
      api_address = "#{@base_url}/#{endpoint}?api_key=#{@key}&query=#{@query}&language=en-US"
      require "http"
      @similarvideos = HTTP.get(api_address).body

      # Get Single Movie

      @single_movie_number = [params[:id]]
      @single_movie_number = @single_movie_number[0]
      endpoint = "movie/#{@single_movie_number}/reviews"
      api_link = "#{@base_url}/#{endpoint}?api_key=#{@key}&language=en-US"
      require "http"
      @getreviews = HTTP.get(api_link).body


  end

  def home
#Get Popular Movies
   base_url = "https://api.themoviedb.org/3"
   endpoint = "movie/popular"
   @key = "2517708c8fb4b77b5994719f8007a06d"
   api_url = "#{base_url}/#{endpoint}?api_key=#{@key}&language=en-US"
   require "http"
   @response = HTTP.get(api_url).body
#get genre array
   genre_api_url = "https://api.themoviedb.org/3/genre/movie/list?api_key=2517708c8fb4b77b5994719f8007a06d&language=en-US"
   @genre = JSON.parse(HTTP.get(genre_api_url).body)
  end

  def genre
    # Get Movies by Genre
        @base_url = "https://api.themoviedb.org/3"
        @key = "2517708c8fb4b77b5994719f8007a06d"
        @genre = params[:genre]
        endpoint = "discover/movie"
        api_uri = "#{@base_url}/#{endpoint}?api_key=#{@key}&with_genres=#{@genre}&language=en-US"
        require "http"
        @moviesbygenre = HTTP.get(api_uri).body

        genre_api_url = "https://api.themoviedb.org/3/genre/movie/list?api_key=2517708c8fb4b77b5994719f8007a06d&language=en-US"
        @getgenre = JSON.parse(HTTP.get(genre_api_url).body)

  end

end
