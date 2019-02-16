class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_access, only: [:show, :edit, :update]

  # GET /users
  # GET /users.json
  def index
    @user = current_user
    @accounts = @user.accounts
    @payrolls = current_user.payrolls
    @companies = current_user.companies
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @accounts = @user.accounts
    @transactions = @user.transactions
    @payrolls = @user.payrolls
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @company_id = user_params[:company_id]
    @user = User.new(user_params.except(:company_id))

    respond_to do |format|
      if @user.save(validate: false)
        @company = current_admin.companies.find(@company_id)
        @company.users << @user

        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def check_access
      if current_admin.users.include?(@user)
        return true
      else
        flash.notice = "You do not have access"
        redirect_back(fallback_location: root_path)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email,
        :password, :password_confirmation, :company_id)
    end
end
