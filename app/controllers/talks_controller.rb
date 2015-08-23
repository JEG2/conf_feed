class TalksController < ApplicationController
  def show
    @conference = Conference.find(params[:conference_id])
    @talk       = @conference.talks.find(params[:id])
    @notes      = @talk.notes
                       .includes(:user)  # eager loading for N + 1 query
                       .order("created_at DESC")
                       .paginate(page: params[:page])
    @note       = Note.new
  end
end
