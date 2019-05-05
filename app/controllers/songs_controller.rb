class SongsController < ApplicationController


    def index
    	@songs = Song.all.order(created_at: :desc)
    end
 	def new
 		@song = Song.new
    end

    def create
    	@song = Song.new(song_params)
    	if @song.save
    		redirect_to new_song_path, notice: 曲の作成に成功しました。
    	else
    		redirect_to new_song_path, notice: 曲の作成に失敗しました。
    	end

    end


    def show
    	@song = Song.find(params[:id])
    end

    def edit
    	@song = Song.find(params[:id])
    end

    def update
    	@song = Song.find(params[:id]
    	if @song.update(song_params)
    		redirect_to song_path(@song.id), notice: '曲名が編集されました。'
    	else
    		render :index, notice: '曲の編集に失敗。'
    	end
    end

    def destroy
    	song = Song.find(params[:id])
    	if song.delete
    	redirect_to songs_path, notice: '曲は削除されました。'
    	else
    		render :index, notice: '曲の削除に失敗。'
    	end
    end

    private
    def song_params
    	params.require(:song).permit(:song_name)
    end

end
