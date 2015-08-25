class NotesController < ApplicationController
  before_filter :find_talk
  before_filter :ensure_ajax, only: :index

  def index
    query  = @talk.notes.order("created_at DESC")
    query  = query.where("id > ?", params[:after_id]) \
      if params[:after_id] =~ /\A\d+\z/
    @notes = query.paginate(page: params[:page])
    render :index, layout: false
  end

  def create
    @note      = @talk.notes.build(note_params)
    @note.user = current_user
    unless @note.save
      flash[:alert] = "Please enter a note."
    end
    redirect_to conference_talk_path(@conference, @talk)
  end

  private

  def find_talk
    @conference = Conference.find(params[:conference_id])
    @talk       = @conference.talks.find(params[:talk_id])
  end

  def note_params
    params.require(:note).permit(:body)
  end
end
