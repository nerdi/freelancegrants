class CategoriesController < ApplicationController
  before_action :set_categorie, only: [:show, :edit, :update, :destroy]

  # GET /categorie
  # GET /categorie.json
  def index
    @categories = Category.all
  end

  # GET /category/1
  # GET /category/1.json
  def show
  end

  # GET /category/new
  def new
    @category = category.new
  end

  # GET /category/1/edit
  def edit
  end

  # POST /category
  # POST /category.json
  def create
    @category = category.new(category)

    respond_to do |format|
      if @category.save
        format.html { redirect_to :back, notice: 'category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { redirect_to :back }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category/1
  # PATCH/PUT /category/1.json
  def update
    respond_to do |format|
      if @category.update(category)
        format.html { redirect_to @category, notice: 'category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category/1
  # DELETE /category/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to category, notice: 'category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:first_name, :email, :last_name, :interest, :poo_bear, :categories)
    end
end
