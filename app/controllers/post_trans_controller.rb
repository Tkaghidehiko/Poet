class PostTransController < ApplicationController


    def create
        @poem = PostPoem.find(params[:post_poem_id])
    	@tran = PostTran.new(post_tran_params)
    	if @tran.save
    	redirect_to post_poem(@poem), notice: "翻訳の作成に成功しました。"
    	else
            @song = @poem.song
            @poem = PostPoem.find(params[:post_poem_id])
            @tran = @poem.post_trans.new
    		render template: "post_poems/show", notice: "曲の作成に失敗しました。"
    	end

    end


    def edit
    	@tran = PostTran.find(params[:id])
    end

    def update
    	@tran = PostTran.find(params[:id])
    	if @tran.update(post_tran_params)
			# redirect_to post_tran_path(@tran.id), notice: '翻訳内容が編集されました。'
            redirect_to post_trans_path, notice: '翻訳内容が編集されました。'
    	else
			render :index, notice: '翻訳の編集に失敗。'
    	end
    end

    def destroy
    	tran = PostTran.find(params[:id])
    	if tran.delete
    	redirect_to post_trans_path, notice: '翻訳は削除されました。'
    	else
    		render :index, notice: '翻訳の削除に失敗。'
    	end
    end

    private
    def post_tran_params
    	params.require(:post_tran).permit(:user_id, :post_poem_id, :song_translate)
    end


end
