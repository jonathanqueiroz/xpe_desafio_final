module Api
  module V1
    class ClientsController < BaseController
      before_action :set_client, only: [ :show, :update, :destroy ]

      def index
        @clients = client_service.find_all
        render json: ClientDto.collection(@clients)
      end

      def count
        render json: { count: client_service.count }
      end

      def search
        @clients = client_service.search_by_name(params[:name])
        render json: ClientDto.collection(@clients)
      end

      def show
        render json: ClientDto.new(@client).call
      end

      def create
        @client = client_service.create(client_params)
        render json: ClientDto.new(@client).call, status: :created
      end

      def update
        @client = client_service.update(@client, client_params)
        render json: ClientDto.new(@client).call
      end

      def destroy
        client_service.destroy(@client)
        head :no_content
      end

      private

      def client_service
        @client_service ||= ClientService.new
      end

      def set_client
        @client = client_service.find_by_id(params[:id])
      end

      def client_params
        params.require(:client).permit(:name, :email, :cpf)
      end
    end
  end
end
