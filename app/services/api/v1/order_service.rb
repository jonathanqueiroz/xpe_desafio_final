module Api
  module V1
    class OrderService
      def find_all
        Order.all
      end

      def find_by_id(id)
        Order.find(id)
      end

      def create(params)
        Order.create!(params)
      end

      def update(order, params)
        Order.transaction do
          order.order_items.destroy_all
          order.update!(params)
        end
        order
      end

      def destroy(order)
        order.destroy
      end

      def count
        Order.count
      end
    end
  end
end
