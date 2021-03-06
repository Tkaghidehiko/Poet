class ArtistsController < ApplicationController


    def index
    	@artists = Artist.all.order(created_at: :desc)
        @search_a = Artist.ransack(params[:q])
        @search_artists = @search_a.result.page(params[:page])
    end

    def new
        @artist = Artist.new
        @song = @artist.songs.build
        @poem = @song.post_poems.build
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
        @artist.user_id = current_user.id
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
        params.require(:artist).permit(:artist_name,
                                        songs_attributes: [:id, :artist_id, :album_name, :song_name, :_destroy,
                                        post_poems_attributes: [:id, :song_id, :poem, :_destroy,
                                            post_trans_attributes: [:id, :post_poem_id, :song_translate]]])
    end
end
