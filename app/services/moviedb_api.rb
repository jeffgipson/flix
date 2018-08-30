# Get Movies
class GetMovies
  require "http"
  def initialize(api_key,endpoint,query)
    @api_key = api_key
    @endpoint = endpoint
    @query = query
  end
    def call

      if @endpoint == "search/movie"

    @query = ""
    if params[:keyword].present?
    @query= [params[:keyword]]
    else
    @query = ["a"]
    end

    @query_string = @query[0]
    @query = @query.to_s.gsub(/\s/, '%20')
    base_url = "https://api.themoviedb.org/3"

    api_url = "#{base_url}/#{@endpoint}?api_key=#{@api_key}&query=#{@query}&language=en-US&include_adult=false"
    @response = HTTP.get(api_url).body

  else
    
  end
end


end
