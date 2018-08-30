class RegistrationsController < Devise::RegistrationsController
  require "http"
  def update
    user = User.find(params[:id])
    if user.update_without_password(my_user_params.except(:password))
      puts 'ok'
    end

  end
  def update_resource(resource, params)
    # Require current password if user is trying to change password.
    return super if params["password"]&.present?

    # Allows user to update registration information without password.
    resource.update_without_password(params.except("current_password"))
  end

  def my_user_params
    params.require(:user).permit(:bio, :profile_image, :password, :password_confirmation, :lname, :fname, :email, :cover_image)
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
