module Api
  module V1
    class ProductDto < BaseDto
      def initialize(product)
        @product = product
      end

      def call
        {
          id: @product.id,
          name: @product.name,
          description: @product.description,
          price: @product.price,
          created_at: @product.created_at,
          updated_at: @product.updated_at
        }
      end

      def self.collection(products)
        products.map { |product| new(product).call }
      end
    end
  end
end
