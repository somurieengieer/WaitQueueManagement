
class WaitQueuesController < ApplicationController
  before_action :set_wait_queue, only: [:show, :edit, :update, :destroy]
  before_action :create_qr, only: [:show, :create, :update]

  # GET /wait_queues
  # GET /wait_queues.json
  def index
    @wait_queues = WaitQueue.where(admin_id: session[:admin_id])
  end

  # GET /wait_queues/1
  # GET /wait_queues/1.json
  def show
    @waiters = Waiter.where(wait_queue_id: @wait_queue.id)

    nextWaiter = @wait_queue.waiters.where("status = ''").order('order_number').first
    begin
      @nextWaiter_order = nextWaiter.order_number
    rescue => e
      p e.message
    end

    currentWaiter = @wait_queue.waiters.where("status in (?)", [Waiter.getStatusAry[1][1], Waiter.getStatusAry[2][1]]).order('order_number DESC').first
    begin
      @wait_queue.count = currentWaiter.order_number 
      @wait_queue.save
    rescue => e
      p e.message
    end
  end

  # GET /wait_queues/new
  def new
    @wait_queue = WaitQueue.new
    @wait_queue.count = 0
    if session[:admin_id] then
      @wait_queue.admin_id = session[:admin_id]
    end
  end

  # GET /wait_queues/1/edit
  def edit
  end

  # POST /wait_queues
  # POST /wait_queues.json
  def create
    @wait_queue = WaitQueue.new(wait_queue_params)

    respond_to do |format|
      if @wait_queue.save
        format.html { redirect_to @wait_queue, notice: 'Wait queue was successfully created.' }
        format.json { render :show, status: :created, location: @wait_queue }
      else
        format.html { render :new }
        format.json { render json: @wait_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wait_queues/1
  # PATCH/PUT /wait_queues/1.json
  def update
    respond_to do |format|
      if @wait_queue.update(wait_queue_params)
        format.html { redirect_to @wait_queue, notice: 'Wait queue was successfully updated.' }
        format.json { render :show, status: :ok, location: @wait_queue }
      else
        format.html { render :edit }
        format.json { render json: @wait_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wait_queues/1
  # DELETE /wait_queues/1.json
  def destroy
    @wait_queue.destroy
    respond_to do |format|
      format.html { redirect_to wait_queues_url, notice: 'Wait queue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wait_queue
      @wait_queue = WaitQueue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wait_queue_params
      params.require(:wait_queue).permit(:name, :count, :admin_id, :reset_time, :auto_reset)
    end
    
    def create_qr
      options = {
        fill: 'white',
        color: 'black',
        size: 100,
        border_modules: 3,
        module_px_size: 5,
        file: nil,
      }
      new_waiter_fullpath = request.original_url.match(/(http.?\/\/*.+?)\//)[1] + \
          Rails.application.routes.url_helpers.new_waiter_path + "?wait_queue_id=" + @wait_queue.id.to_s
      qr = RQRCode::QRCode.new(new_waiter_fullpath).as_png(options)
      $qrcode_tag = ChunkyPNG::Image.from_datastream(qr.resize(500,500).to_datastream).to_data_url
    end
end
