class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  authorize_resource
  # GET /answers/1/edit
  def edit
  end
  
  # POST /answers
  # POST /answers.json
  def create
    #binding.pry
    @answer  = current_user.answers.build(answer_params)
    
    respond_to do |format|
      if @answer.save
        format.html { redirect_to request.referer}
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to Question.find(@answer.question_id), notice: 'Answer was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  
  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to Question.find(@answer.question_id) }
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
