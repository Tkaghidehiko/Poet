class ArtistsController < ApplicationController


    def index
    	@artists = Artist.all.order(created_at: :desc)
    end
 	def new
 		@artist = Artist.new
    end

    def create
    	@artist = Artist.new(artist_params)
    	if @artist.save
    	redirect_to new_artist_song_path(@artist), notice: "アーティスト作成に成功しました。"
    	else
    	render :new, notice: "アーティストの作成に失敗しました。"
    	end

    end


    def show
    	@artist = Artist.find(params[:id])
    end

    def edit
    	@artist = Artist.find(params[:id])
    end

    def update
    	@artist = Atist.find(params[:id])
    	if @artist.update(artist_params)
    		redirect_to artist_path(@artist.id), notice: 'アーティスト名が編集されました。'
    	else
    		render :index, notice: 'アーティストの編集に失敗。'
    	end
    end

    def destroy
    	artist = Artist.find(params[:id])
    	if artist.delete
    	redirect_to artists_path, notice: 'アーティストは削除されました。'
    	else
    		render :index, notice: 'アーティストの削除に失敗。'
    	end
    end

    private
    def artist_params
    	params.require(:artist).permit(:artist_name)
    end

end
