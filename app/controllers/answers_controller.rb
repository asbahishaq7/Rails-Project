class AnswersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /answers/1/edit
  def edit
    respond_to do |format|
      format.json { redirect_to root_path, notice: t(:json_error) }
      format.html { }
    end
  end
  
  # POST /answers
  def create
    #binding.pry
    @answer  = current_user.answers.build(answer_params)
    
    respond_to do |format|
      if @answer.save
        format.html { redirect_to request.referer, notice: t(:answer_created)  }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /answers/1
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer.question, notice: t(:answer_updated) }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  
  # DELETE /answers/1
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to @answer.question, notice: t(:answer_deleted)  }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:detail, :question_id)
    end
end
