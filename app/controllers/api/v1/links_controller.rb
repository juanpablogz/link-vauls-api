require 'byebug'
module Api
  module V1
    class LinksController < Api::V1::ApiController  
      def index
        link = Link.where(user_id: current_user.id)
        render json: link
      end
      def show
        link = Link.find_by(lookup_code: params[:id])
        render json: link
      end

      def create
        shortener = Shortener.new(link_params[:original_url])
        @link = shortener.generate_short_link
        @link.user_id = current_user.id
        @link.title = link_params[:title]
        @link.save
        render json: @link
      end
    
      private 
      def link_params
        params.require(:link).permit(:original_url, :title).merge(user_id: current_user.id)
      end
    
    end
  end
end