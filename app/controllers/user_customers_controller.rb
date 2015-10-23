class UserCustomersController < ApplicationController
  before_action :set_user_customer, only: [:show, :edit, :update, :destroy]

  # GET /user_customers
  # GET /user_customers.json
  def index
    @user_customers = UserCustomer.all
  end

  # GET /user_customers/1
  # GET /user_customers/1.json
  def show
		@user_customer = UserCustomer.find(params[:id])
		@user = User.find(@user_customer.user_id)
  end

  # GET /user_customers/new
  def new
    @user_customer = UserCustomer.new
		@user_customer.user_id = 1
		@user_customer.save!
  end

  # GET /user_customers/1/edit
  def edit
  end

  # POST /user_customers
  # POST /user_customers.json
  def create
    @user_customer = UserCustomer.new(user_customer_params)

    respond_to do |format|
      if @user_customer.save
        format.html { redirect_to @user_customer, notice: 'User customer was successfully created.' }
        format.json { render :show, status: :created, location: @user_customer }
      else
        format.html { render :new }
        format.json { render json: @user_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_customers/1
  # PATCH/PUT /user_customers/1.json
  def update
    respond_to do |format|
      if @user_customer.update(user_customer_params)
        format.html { redirect_to @user_customer, notice: 'User customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_customer }
      else
        format.html { render :edit }
        format.json { render json: @user_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_customers/1
  # DELETE /user_customers/1.json
  def destroy
    @user_customer.destroy
    respond_to do |format|
      format.html { redirect_to user_customers_url, notice: 'User customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_customer
      @user_customer = UserCustomer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_customer_params
      params.require(:user_customer).permit(:name, :address, :zipcode, :phone)
    end
end