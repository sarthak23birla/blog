class CommentsController < ApplicationController
	before_action :set_article, only: [:create]
  def create
  	@comment = @article.comments.new(comment_params)
    @comment.commentor = current_user
    respond_to do |format|
      binding.pry
      if @comment.save
        format.html { redirect_to @article, notice: 'Comment was successfully posted.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body,:comment_id)
  end

end
