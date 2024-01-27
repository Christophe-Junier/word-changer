class WordsController < ApplicationController
  before_action :get_text_id
  def index
    if request.xhr?
      results = Word.where(text_id: @text_id, updated_at: 1.minutes.ago..).pluck(:id, :content)
      render json: results
    end
  end

  private

  def get_text_id
    @text_id = permitted_params[:text_id]
  end

  def permitted_params
    params.permit(:text_id)
  end
end
