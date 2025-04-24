module Api
  module V1
    class ProductService
      def list_all
        Product.all
      end

      def find(id)
        Product.find(id)
      end

      def search(name)
        Product.where('name ILIKE ?', "%#{name}%")
      end

      def create(params)
        Product.create!(params)
      end

      def update(product, params)
        product.update!(params)
        product
      end

      def destroy(product)
        product.destroy
      end

      def count
        Product.count
      end
    end
  end
end
