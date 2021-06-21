class Admin::FrequentlyAskedQuestionsController < Admin::BaseController
  before_action :set_faq, only: [:show, :edit, :update, :destroy]
  def new
  end

  def show
  end

  def index
    @faqs = FrequentlyAskedQuestion.all
  end

  def create
    @faq = FrequentlyAskedQuestion.new(faq_params)
    if @faq.save
      flash[:success] = "You successfully added a new FAQ to your database!"
      redirect_to admin_frequently_asked_question_path(@faq)
    else
      @faq.errors.messages.each do |key, value|
        error = value[0]
        flash.now[:error] = "The #{key} #{error}! Please try again"
      end
      render :new
    end
  end

  def edit
  end

  def update
    if @faq.update(faq_params)
      flash[:success] = 'Congrats! The FAQ was updated!'
      redirect_to admin_frequently_asked_question_path(@faq)
    else
      flash[:message] = 'All fields must be filled out. There is a missing field. Try again'
      render :edit
    end
  end

  def destroy
    if @faq.destroy
      flash[:notice] = "You have successfully destroyed your FAQ"
      redirect_to admin_frequently_asked_questions_path
    else
      flash.now[:notice] = "Unable to destroy this FAQ. Try again"
      render :show
    end
  end

  private

  def set_faq
    @faq = FrequentlyAskedQuestion.find(params[:id])
  end

  def faq_params
    if params[:frequently_asked_question]
      params.require(:frequently_asked_question).permit(:question, :answer)
    else
      hash = {}
      hash[:question] = params[:question]
      hash[:answer] = params[:answer]
      return hash
    end
  end
end
