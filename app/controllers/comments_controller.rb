class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /comments/1/edit
  def edit
    respond_to do |format|
      format.json { redirect_to root_path, notice: t(:json_error) }
      format.html { }
    end
  end
  

  # POST /comments
  def create
    @comment = current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to request.referer, notice: t(:comment_created)  }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /comments/1
  def update
    commentable = get_redirect_route

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to commentable, notice: t(:comment_updated) }
      else
        format.html { render action: 'edit' }
      end
    end
  end


  # DELETE /comments/1
  def destroy
    commentable = get_redirect_route
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to commentable, notice: t(:comment_deleted)  }
    end
  end

  private
    def get_redirect_route
      commentable = @comment.commentable
    
      if @comment.commentable_type == 'Answer'
        commentable = commentable.question
      end
      return commentable
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:detail, :commentable_id, :commentable_type)
    end
end
