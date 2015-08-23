class NotesController < ApplicationController
  def create
    @conference = Conference.find(params[:conference_id])
    @talk       = @conference.talks.find(params[:talk_id])
    @note       = @talk.notes.build(note_params)
    @note.user  = current_user
    unless @note.save
      flash[:alert] = "Please enter a note."
    end
    redirect_to conference_talk_path(@conference, @talk)
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end
end
