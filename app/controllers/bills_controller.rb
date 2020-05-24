class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

 

  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.all
    @Invoice = Invoice.all
    #
    @bill_pending = @bills.where('due_date > ?', Date.today+7.day)
    @bill_active = Bill.joins('FULL OUTER JOIN "invoices" ON "bills"."id" = "invoices"."bill_id" ').where("invoices.bill_id IS NULL").where('due_date <= ?', Date.today+7.day)
    @bill_invoiced = Bill.select('bills.*,invoices.bill_id').left_outer_joins(:invoice).where('due_date <= ?', Date.today+7.day).where('bills.id = invoices.bill_id')
  end 

  def createinvoice
    @invoice = Invoice.new(invoice_params)
    respond_to do |format|
        if @invoice.save
          format.html { redirect_to bills_path, notice: 'Invoice was successfully created.' }
          format.json { render :show, status: :created, location: @bill }
        else
          format.html { redirect_to bills_path, notice: 'Error' }
          format.json { render json: @bill.errors, status: :unprocessable_entity }
        end
      end
  end
  # GET /bills/1
  # GET /bills/1.json
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
    @customer = Customer.all
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = Bill.new(bill_params)

    respond_to do |format|
      if @bill.save
        format.html { redirect_to bills_path, notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to bills_path, notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bill_params
        params.require(:bill).permit(:bill_no, :due_date, :customer_id,:amount)
    end
    #
    def invoice_params
        params.require(:invoice).permit(:bill_id, :amount, :invoice_user, :invoice_date)
    end
end
