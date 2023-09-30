class TransactionsController < ApplicationController
  before_action :set_category, only: [:new, :create]
  before_action :set_transaction, only: %i[show edit update destroy]

  # GET /transactions or /transactions.json
  def index
    @category = Category.find(params[:category_id])
    @transactions = @category.transactions.order(created_at: :desc)
    @total_amount = @transactions.sum(:amount)
    @page_name = "Transactions"
  end
  

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @category = Category.find(transaction_params[:category_id]) # Load the category based on the submitted category_id
    @transaction = @category.transactions.build(transaction_params)
    @transaction.user = current_user
    
    if @transaction.save
      # Assuming @transaction has a category_id that you want to use
      redirect_to category_transactions_path(@transaction.category_id), notice: "Transaction was successfully created."
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transaction_url(@transaction), notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_category
      @category = Category.find_by(id: params[:category_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:name, :amount, :category_id) # Use category_ids for multiple categories
    end    
end
