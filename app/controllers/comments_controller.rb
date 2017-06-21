class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  authorize_resource
  # GET /comments/1/edit
  def edit
  end
  

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to request.referer}
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to Question.find(@comment.commentable_id), notice: 'Comment was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end


  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to Question.find(@comment.commentable_id) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:detail, :commentable_id, :commentable_type)
    end
end
