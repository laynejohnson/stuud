class CalendarController < ApplicationController
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:all_day, :start_time, :end_time, :title)
  end
end
