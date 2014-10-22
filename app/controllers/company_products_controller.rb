class CompanyProductsController < ApplicationController
  before_action :set_company_product, only: [:show, :edit, :update, :destroy]

  # GET /company_products
  # GET /company_products.json
  def index
    @company_products = CompanyProduct.all
  end

  # GET /company_products/1
  # GET /company_products/1.json
  def show
  end

  # GET /company_products/new
  def new
    @company_product = CompanyProduct.new
  end

  # GET /company_products/1/edit
  def edit
  end

  # POST /company_products
  # POST /company_products.json
  def create
    @company_product = CompanyProduct.new(company_product_params)

    respond_to do |format|
      if @company_product.save
        format.html { redirect_to @company_product, notice: 'Company product was successfully created.' }
        format.json { render :show, status: :created, location: @company_product }
      else
        format.html { render :new }
        format.json { render json: @company_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_products/1
  # PATCH/PUT /company_products/1.json
  def update
    respond_to do |format|
      if @company_product.update(company_product_params)
        format.html { redirect_to @company_product, notice: 'Company product was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_product }
      else
        format.html { render :edit }
        format.json { render json: @company_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_products/1
  # DELETE /company_products/1.json
  def destroy
    @company_product.destroy
    respond_to do |format|
      format.html { redirect_to company_products_url, notice: 'Company product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_product
      @company_product = CompanyProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_product_params
      params.require(:company_product).permit(:product_id, :company_id, :quantity, :quantity_unit, :price, :price_unit)
    end
end
