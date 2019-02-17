class PayrollsController < ApplicationController
  before_action :set_payroll, only: [:show, :edit, :update, :destroy]

  # GET /payrolls
  # GET /payrolls.json
  def index
    @payrolls = Payroll.all
  end

  # GET /payrolls/1
  # GET /payrolls/1.json
  def show
    @company = Company.find(params[:company_id])
    @transactions = @payroll.transactions
  end

  # GET /payrolls/new
  def new
    @company = Company.find(params[:company_id])

    if @company.accounts.empty?
      redirect_to new_company_account_path(@company)
    end

    @payroll = @company.payrolls.new
    @users = @company.users
    @transactions = @payroll.transactions.new(company_id: @company.id)
  end

  # GET /payrolls/1/edit
  def edit
  end

  # POST /payrolls
  # POST /payrolls.json
  def create
    @company = Company.find(params[:company_id])
    transaction_params = {transactions_attributes: {}}

    payroll_params.to_h['transactions_attributes'].each do |transaction|
      if transaction[1].delete(:user).to_s == '1'
        transaction_params[:transactions_attributes][transaction[0]] = transaction[1]
      end
    end

    new_payroll_params = {
      admin_id: payroll_params[:admin_id],
      company_id: payroll_params[:company_id],
      notes: payroll_params[:notes],
      batch_number: payroll_params[:batch_number],
      pay_period: payroll_params[:pay_period],
      transactions_attributes: transaction_params[:transactions_attributes]
    }

    @payroll = @company.payrolls.new(new_payroll_params)
    respond_to do |format|
      if @payroll.save
        @transactions = @payroll.transactions
        format.js # actually means: if the client ask for js -> return file.js
        format.html { redirect_to @company, notice: 'Payroll was successfully created.' }
        format.json { render :show, status: :created, location: @payroll }
      else
        @users = @company.users
        format.html { render :new, @users }
        format.json { render json: @payroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payrolls/1
  # PATCH/PUT /payrolls/1.json
  def update
    respond_to do |format|
      if @payroll.update(payroll_params)
        format.html { redirect_to @payroll, notice: 'Payroll was successfully updated.' }
        format.json { render :show, status: :ok, location: @payroll }
      else
        format.html { render :edit }
        format.json { render json: @payroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payrolls/1
  # DELETE /payrolls/1.json
  def destroy
    @payroll.destroy
    respond_to do |format|
      format.html { redirect_to payrolls_url, notice: 'Payroll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payroll
      @payroll = Payroll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payroll_params
      params.require(:payroll).permit(:admin_id, :company_id, :notes, :batch_number, :pay_period,
        transactions_attributes: [
          :company_id,
          :company_name,
          :from_address,
          :user_id,
          :user_email,
          :to_address,
          :user,
          :amount,
          :currency_id,
          :notes,
          :result_hash
        ])
    end
end
