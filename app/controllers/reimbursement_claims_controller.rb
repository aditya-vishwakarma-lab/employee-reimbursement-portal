class ReimbursementClaimsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reimbursement_claim, only: %i[ show edit update destroy ]
  before_action :load_employees, only: [:new, :create, :edit, :update]

  # GET /reimbursement_claims or /reimbursement_claims.json
  def index
    @reimbursement_claims = ReimbursementClaim.joins(employee: :company).where(companies: { user_id: current_user.id })
  end

  # GET /reimbursement_claims/1 or /reimbursement_claims/1.json
  def show
  end

  # GET /reimbursement_claims/new
  def new
    @reimbursement_claim = ReimbursementClaim.new
  end

  # GET /reimbursement_claims/1/edit
  def edit
  end

  # POST /reimbursement_claims or /reimbursement_claims.json
  def create
    @reimbursement_claim = ReimbursementClaim.new(reimbursement_claim_params)

    respond_to do |format|
      if @reimbursement_claim.save
        format.html { redirect_to reimbursement_claim_url(@reimbursement_claim), notice: "Reimbursement claim was successfully created." }
        format.json { render :show, status: :created, location: @reimbursement_claim }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reimbursement_claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reimbursement_claims/1 or /reimbursement_claims/1.json
  def update
    respond_to do |format|
      if @reimbursement_claim.update(reimbursement_claim_params)
        format.html { redirect_to reimbursement_claim_url(@reimbursement_claim), notice: "Reimbursement claim was successfully updated." }
        format.json { render :show, status: :ok, location: @reimbursement_claim }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reimbursement_claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reimbursement_claims/1 or /reimbursement_claims/1.json
  def destroy
    @reimbursement_claim.destroy!

    respond_to do |format|
      format.html { redirect_to reimbursement_claims_url, notice: "Reimbursement claim was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reimbursement_claim
      @reimbursement_claim = ReimbursementClaim.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reimbursement_claim_params
      params.require(:reimbursement_claim).permit(:employee_id, :purpose, :amount, :date_of_expenditure, :receipt_url)
    end

    def load_employees
      @employees = Employee.joins(:company).where(companies: { user_id: current_user.id })
    end
end
