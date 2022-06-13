class PersonController < ApplicationController
  #before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @person = Person.all

  end

  # GET /articles/1 or /articles/1.json
  def show
    @aperson = Person.find(params[:id])
  end

  # GET /articles/new
  def new
    @person = Person.new
  end

  # GET /articles/1/edit


  # POST /articles or /articles.json
  def create
    @person = Person.new(article_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to article_url(@person), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:person).permit(:name)
    end
end
