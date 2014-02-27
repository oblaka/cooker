class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]

  # GET /parts
  # GET /parts.json
  def index
    @parts = Part.all
  end

  # GET /parts/1
  # GET /parts/1.json
  def show
    @recipe = @part.recipe
  end

  # GET /parts/new
  def new
    @part = Part.new
  end

  # GET /parts/1/edit
  def edit
    @recipe = @part.recipe
  end

  # POST /parts
  # POST /parts.json
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @part = @recipe.parts.create(params[:part].permit(:quantity, :product_id))

    respond_to do |format|
      if @part.save
        format.html { redirect_to recipe_path(@recipe), notice: 'Part was successfully created.' }
        format.json { render action: 'show', status: :created, location: @part }
      else
        format.html { render action: 'new' }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parts/1
  # PATCH/PUT /parts/1.json
  def update
    @recipe = @part.recipe
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to recipe_path(@recipe), notice: 'Part was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render controller: 'recipes', action: 'edit' }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1
  # DELETE /parts/1.json
  def destroy
    @recipe = @part.recipe
    @part.destroy
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_params
      params.require(:part).permit(:quantity, :recipe_id, :product_id)
    end
end
