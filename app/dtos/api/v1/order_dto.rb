module Api
  module V1
    class OrderDto < BaseDto
      def initialize(order)
        @order = order
      end

      def call
        {
          id: @order.id,
          client_id: @order.client_id,
          status: @order.status,
          client: ClientDto.new(@order.client).call,
          items: order_items,
          total_amount: @order.total_amount,
          created_at: @order.created_at,
          updated_at: @order.updated_at
        }
      end

      def self.collection(orders)
        orders.map { |order| new(order).call }
      end

      private

      def order_items
        @order.order_items.map do |item|
          {
            id: item.id,
            product_id: item.product_id,
            quantity: item.quantity,
            unit_price: item.unit_price,
            total: item.quantity * item.unit_price
          }
        end
      end
    end
  end
end
