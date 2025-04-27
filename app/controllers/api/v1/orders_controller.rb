module Api
  module V1
    class OrdersController < BaseController
      before_action :set_order, only: [ :show, :update, :destroy ]

      def index
        @orders = order_service.list_all
        render json: OrderDto.collection(@orders)
      end

      def count
        render json: { count: order_service.count }
      end

      def show
        render json: OrderDto.new(@order).call
      end

      def create
        @order = order_service.create(order_params)
        render json: OrderDto.new(@order).call, status: :created
      end

      def update
        @order = order_service.update(@order, order_params)
        render json: OrderDto.new(@order).call
      end

      def destroy
        order_service.destroy(@order)
        head :no_content
      end

      private

      def order_service
        @order_service ||= OrderService.new
      end

      def set_order
        @order = order_service.find(params[:id])
      end

      def order_params
        params.require(:order).permit(
          :client_id,
          :status,
          order_items_attributes: [ :product_id, :quantity, :unit_price ]
        )
      end
    end
  end
end
