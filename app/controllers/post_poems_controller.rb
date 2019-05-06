class PostPoemsController < ApplicationController


    def index
    	@poems = PostPoem.all.order(created_at: :desc)
    end
 	def new
 		@poem = PostPoem.new
    end

    def create
    	@poem = PostPoem.new(post_poem_params)
    	@poem.user_id = @current_user.id
    	# if
    		@poem.save
    		redirect_to new_post_tran_path, notice: "歌詞作成に成功しました。"
    	# else
    	# 	redirect_to new_post_poem_path, notice: "歌詞作成に失敗しました。"
    	# end

    end


    def show
    	@poem = PostPoem.find(params[:id])
    end

    def edit
    	@poem = PostPoem.find(params[:id])
    end

    def update
    	@poem = PostPoem.find(params[:id])
    	@poem.user_id = @current_user.id
    	if @poem.update(post_poem_params)
    		redirect_to post_poem_path(@post_poem.id), notice: '歌詞内容が編集されました。'
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
    def post_poem_params
    	params.require(:post_poem).permit(:poem)
    end
end
