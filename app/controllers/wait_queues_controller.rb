class WaitQueuesController < ApplicationController
  before_action :set_wait_queue, only: [:show, :edit, :update, :destroy]

  # GET /wait_queues
  # GET /wait_queues.json
  def index
    @wait_queues = WaitQueue.all
  end

  # GET /wait_queues/1
  # GET /wait_queues/1.json
  def show
  end

  # GET /wait_queues/new
  def new
    @wait_queue = WaitQueue.new
    @wait_queue.count = 1
    if params[:admin_id] then
      @wait_queue.admin_id = params[:admin_id]
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
end
