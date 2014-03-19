class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :produce]
  before_filter :set_current_user

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @parts = @recipe.parts
    @avaliable = @recipe.avaliable
  end

  def produce
    @count = recipe_count[:count].to_i
    count = @count
    unless @recipe.avaliable < count.to_i
      @recipe.produce(count)
      redirect_to recipe_path(@recipe), notice: "Успешно приготовлено !"
    else
      redirect_to recipe_path(@recipe), alert: 'Требуется больше продуктов!'
    end
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  def parts
    @parts = @recipe.parts
  end

  # GET /recipes/1/edit
  def edit
    @parts = @recipe.parts
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.where(id: params[:id]).first
      render_404 unless @recipe
    end

    def set_uid
      unless current_user.nil?
        @uid = current_user.id
      else
        redirect_to new_user_session_path, alert: "Необходимо войти в систему, чтобы посмотреть узнать подробности"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :quantity, :unit, parts: [ :product_id, :quantity] )
    end

    def recipe_count
      params.permit :id, :count
    end
end
