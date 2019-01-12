class WaitersController < ApplicationController
  before_action :set_waiter, only: [:show, :edit, :update, :destroy, :skip, :done]

  # GET /waiters
  # GET /waiters.json
  def index
    @waiters = Waiter.all
  end

  # GET /waiters/1
  # GET /waiters/1.json
  def show
  end

  # GET /waiters/new
  def new
    @waiter = Waiter.new
    @waiter.status = Waiter.getStatusAry[0][1]
    if params[:wait_queue_id]
      @waiter.wait_queue_id = params[:wait_queue_id]
      max = Waiter.where("wait_queue_id = ?", @waiter.wait_queue_id).maximum(:order_number)
      if max.nil?
        @waiter.order_number = 1
      else
        @waiter.order_number = max + 1
      end
    end
  end

  # GET /waiters/1/edit
  def edit
  end

  # POST /waiters
  # POST /waiters.json
  def create
    @waiter = Waiter.new(waiter_params) # wait_queue_idは設定済み

    respond_to do |format|
      if @waiter.save
        format.html { redirect_to @waiter, notice: 'Waiter was successfully created.' }
        format.json { render :show, status: :created, location: @waiter }
      else
        format.html { render :new }
        format.json { render json: @waiter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waiters/1
  # PATCH/PUT /waiters/1.json
  def update
    respond_to do |format|
      if @waiter.update(waiter_params)
        format.html { redirect_to @waiter, notice: 'Waiter was successfully updated.' }
        format.json { render :show, status: :ok, location: @waiter }
      else
        format.html { render :edit }
        format.json { render json: @waiter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waiters/1/skip
  # PATCH/PUT /wait_queues/1/skip.json
  def skip
    respond_to do |format|
      @waiter.status = Waiter.getStatusAry[1][1]
      if @waiter.save
        @wait_queue = WaitQueue.find(@waiter.wait_queue_id)
        format.html { redirect_to @wait_queue, notice: 'Skip successfully.' }
        format.json { render :show, status: :ok, location: @wait_queue }
      end
    end
  end

  # PATCH/PUT /waiters/1/done
  # PATCH/PUT /wait_queues/1/done.json
  def done
    respond_to do |format|
      @waiter.status = Waiter.getStatusAry[2][1]
      if @waiter.save
        @wait_queue = WaitQueue.find(@waiter.wait_queue_id)
        format.html { redirect_to @wait_queue, notice: 'Done successfully.' }
        format.json { render :show, status: :ok, location: @wait_queue }
      end
    end
  end
  
  # DELETE /waiters/1
  # DELETE /waiters/1.json
  def destroy
    @waiter.destroy
    respond_to do |format|
      format.html { redirect_to waiters_url, notice: 'Waiter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waiter
      @waiter = Waiter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waiter_params
      params.require(:waiter).permit(:name, :wait_queue_id, :order_number, :status)
    end
end
