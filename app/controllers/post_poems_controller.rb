class PostPoemsController < ApplicationController







    def show
        @song = Song.find(params[:id])
        @poem = PostPoem.find(params[:id])
        # @tran = PostTran.new
        @tran = @poem.post_trans.new
    end

    def edit
    	@poem = PostPoem.find(params[:id])
    end

    def update
    	@poem = PostPoem.find(params[:id])
    	if @poem.update(post_poem_params)
            @song = @poem.song
    		redirect_to song_path(@song), notice: '歌詞内容が編集されました。'
    	else
    		render :index, notice: '歌詞内容の編集に失敗。'
    	end
    end

    def destroy
    	poem = PostPoem.find(params[:id])
    	if poem.delete
    	redirect_to post_poems_path, notice: '歌詞は削除されました。'
    	else
    		render :index, notice: '歌詞の削除に失敗。'
    	end
    end

        private
    def song_params
        params.require(:song).permit(:artist_id, :song_name, :album_name, 
            post_poems_attributes: [:id, :poem, :song_id, :_destroy, 
                post_trans_attributes: [:id, :post_poem_id, :song_translate, :_destroy]])
    end

    def post_poem_params
        params.require(:post_poem).permit(:id, :poem, :song_id, :_destroy,
                post_trans_attributes: [:id, :post_poem_id, :song_translate, :_destroy])

end
