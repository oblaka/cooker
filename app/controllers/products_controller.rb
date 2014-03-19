class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :increase, :decrease]
  before_filter :set_current_user

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    if signed_in?
      @item = @product.items.owned.first
        if @item.nil?
          @quantity =  @product.name + ' пора купить, хотя бы несколько '
        else
          @quantity = @item.quantity
        end
    end
  end

  def increase
    @item = @product.items.owned.first
    count = product_count[:count].to_i
    @item.increase(count)
    redirect_to @product
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.where(id: params[:id]).first
      render_404 unless @product
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :quantity, :unit, :description, :count)
    end

    def product_count
      params.permit(:count)
    end

end
