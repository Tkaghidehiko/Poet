class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?


	before_action :set_search



	def after_sign_in_path_for(resource)
		root_path
	end

	def after_sign_up_path_for(resource)
		root_path
	end

	def set_search
	  #@search = Article.search(params[:q])
	  @search = Artist.ransack(params[:q]) #ransackメソッド推奨
	  @search_artists = @search.result.page(params[:page])
	end


	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
end
