class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :set_user_clients, only: [:new,:edit]

  def index
    # start_date = params[:start]
    # end_date = params[:end]
    # @events = Event.where("start_time >= ? AND end_time <= ?", start_date, end_date)
    @events = Event.where(user_id: @user)
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @lengths = [15, 30, 60]
  end

  # GET /events/1/edit
  def edit
  end

  def mark_as_paid
    @event = Event.find(params[:event_id])
    @event.payment_status = true
    if @event.save
      redirect_to finances_path
    else
      flash[:notice] = "Sorry, there was a problem updating that invoice."
      redirect_to finances_path
    end
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.client = Client.find(params[:event][:client_id])
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }

      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirmation_email
    mail = EventMailer.with(event: @event).confirmation(params[:id])
    mail.deliver_later
    redirect_to request.referrer
    flash[:notice] = "Email sent"
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    def set_client
      @client = Client.find(params[:event][:client_id])
    end

    def set_user_clients
      @user_clients = Client.where(user_id:current_user)
    end

    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:all_day, :start_time, :end_time, :title, :color, :user, :client, :description, :price, :length, :date, :status, :payment_status)
    end
end


# # GET /events
  # # GET /events.json
  # def index
  #   @events = Event.all
  # end

  # # GET /events/1
  # # GET /events/1.json
  # def show
  # end

  # # GET /events/new
  # def new
  #   @event = Event.new
  # end

  # # GET /events/1/edit
  # def edit
  # end

  # # POST /events
  # # POST /events.json
  # def create
  #   @event = Event.new(event_params)

  #   respond_to do |format|
  #     if @event.save
  #       format.html { redirect_to @event, notice: 'Event was successfully created.' }
  #       format.json { render :show, status: :created, location: @event }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @event.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /events/1
  # # PATCH/PUT /events/1.json
  # def update
  #   respond_to do |format|
  #     if @event.update(event_params)
  #       format.html { redirect_to @event, notice: 'Event was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @event }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @event.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /events/1
  # # DELETE /events/1.json
  # def destroy
  #   @event.destroy
  #   respond_to do |format|
  #     format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
