class TalksController < ApplicationController
  def show
    @conference = Conference.find(params[:conference_id])
    @talk       = @conference.talks.find(params[:id])
  end
end
