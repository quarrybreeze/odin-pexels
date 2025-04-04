class StaticPagesController < ApplicationController
  def index
    if collection_params[:collection_id].present?
      client = Pexels::Client.new(ENV['PEXELS_API_KEY'])
      @photos = client.collections[collection_params[:collection_id], type: 'photos'].media
    end

  end

  private
  def collection_params
    params.permit(:collection_id,:commit)
  end
end
