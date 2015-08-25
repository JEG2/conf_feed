class ConferencesController < ApplicationController
  skip_before_filter :ensure_signed_in

  def index
    @conferences = Conference.paginate(page: params[:page], per_page: 10)
  end

  def show
    @conference = Conference.find(params[:id])
    @talks      = @conference.talks.order(:presented_at)
    respond_to do |format|
      format.html
      format.json do
        render json: @conference.to_json(
          include: {talks: {include: :notes}},
          except:  [:created_at, :updated_at]
        )
      end
    end
  end
end
