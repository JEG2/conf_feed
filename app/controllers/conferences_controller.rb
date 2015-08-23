class ConferencesController < ApplicationController
  def index
    @conferences = Conference.paginate(page: params[:page], per_page: 10)
  end

  def show
    @conference = Conference.find(params[:id])
    @talks      = @conference.talks.order(:presented_at)
  end
end
