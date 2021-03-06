class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :increase]

  # GET /items
  # GET /items.json
  def index
    @all_items = Item.all #for testing only
    if signed_in?
      @items = current_user.items
    else
      redirect_to new_user_session_path, alert: "Необходимо войти в систему, чтобы посмотреть Items"
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show

  end

  def increase
    count = item_count[:count].to_i
    @item.increase(count)
    redirect_to item_path(@item)
  end

  def decrease
    count = item_count[:count].to_i
    @item.decrease(count)
    redirect_to item_path(@item)
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @product = Product.find(params[:product_id])
    @item = current_user.items.new(item_params)
      if @item.save
        redirect_to @product, success: 'Item was successfully created.'
      else
        redirect_to @product, alert: 'Все проебал'
      end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, success: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', notice: 'Попробуйте еще раз.' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:quantity, :product_id)
    end

    def item_count
      params.permit(:count)
    end

end
