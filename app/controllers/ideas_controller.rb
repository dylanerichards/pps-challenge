class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  def index
    @category = Category.find(params[:category_id])
    @ideas = Idea.all
  end

  def show
  end

  def new
    @category = Category.find(params[:category_id]) if params[:category_id]
    @idea = Idea.new
  end

  def edit
    @category = Category.find(params[:category_id]) if params[:category_id]
  end

  def create
    @category = Category.find(params[:category_id]) if params[:category_id]
    @idea = @category.ideas.build(idea_params)

    respond_to do |format|
      if @idea.save
        current_user.ideas << @idea
        format.html { redirect_to @category, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to category_idea_path(@category, @idea), notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    idea = Idea.find(params[:id])
    idea.upvote
    idea.save
    redirect_to :back
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:title, :body, :category_id, :anonymous, :status, :office)
    end
end
