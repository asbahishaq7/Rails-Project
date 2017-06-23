class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource

  # GET /questions
  def index
    @questions = @questions.page(params[:page]).per_page(5)
  end

  # GET /questions/1
  def show
    respond_to do |format|
      format.json { redirect_to root_path, notice: t(:json_error) }
      format.html { }
    end
    @comments = @question.comments.paginate(page: params[:page], per_page: 2)
    @answers  = @question.answers
    @comment  = @question.comments.build
    #@answer  = @question.answers.build 
  end

  # GET /questions/new
  def new
    respond_to do |format|
      format.json { redirect_to root_path, notice: t(:json_error) }
      format.html { @question = current_user.questions.build }
    end
  end

  # GET /questions/1/edit
  def edit
    respond_to do |format|
      format.json { redirect_to root_path, notice: t(:json_error) }
      format.html { }
    end
  end

  # POST /questions
  def create
    @question = current_user.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: t(:question_created) }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /questions/1
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: t(:question_updated) }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: t(:question_deleted)  }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :description)
    end

end
