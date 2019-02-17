class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  # before_action :admin_signed_in?
  before_action :check_access, only: [:show, :edit, :update]

  def invite
    @company = Company.find(params[:company_id])
    @user = User.invite!(email: params[:email], invited_by_admin_id: current_admin.id)
    @user.companies << @company

    respond_to do |format|
      format.js
    end
  end

  # GET /companies
  # GET /companies.json
  def index
    # @companies = Company.all
    @companies = current_admin.companies
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @users = @company.users
    @accounts = @company.accounts
    @payrolls = @company.payrolls
  end

  # GET /companies/new
  def new
    @company = current_admin.companies.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = current_admin.companies.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    def check_access
      if @company.admins.include?(current_admin)
        return true
      else
        flash.notice = "You do not have access"
        redirect_to :root
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name)
    end
end
