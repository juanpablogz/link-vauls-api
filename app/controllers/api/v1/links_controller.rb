module Api
  module V1
    class LinksController < Api::V1::ApiController
      before_action :set_link, only: %i[update destroy]
      before_action do
        permission?(Link)
      end

      def create
        shortener = Shortener.new(link_params[:original_url])
        @link = shortener.generate_short_link
        @link.user_id = current_user.id
        @link.title = link_params[:title]        
        if @link.save
          render json: @link
        else 
          render json: error_message(@link)
        end
      end

      def index
        link = Link.where(user_id: current_user.id)
        render json: link
      end

      def show
        link = Link.find_by(lookup_code: params[:id])
        render json: link
      end

      def update
        if @link.update(link_params)
          render json: @link
        else
          render json: error_messages(@link)
        end
      end

      def destroy
        @link.destroy
        if @link.destroy
          render json: { message: "removed" }, status: :ok
        end
      end

      private

      def set_link
        @link = Link.find(params[:id])
      end

      def link_params
        params.require(:link).permit(:original_url, :title).merge(user_id: current_user.id)
      end
    end
  end
end
