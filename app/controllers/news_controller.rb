class NewsController < ApplicationController

	def index
		news = PostPoem.all
	end
end
