module Api
  module V1
    class ProductService
      def find_all
        Product.all
      end

      def find_by_id(id)
        Product.find(id)
      end

      def search_by_name(name)
        Product.where("name ILIKE ?", "%#{name}%")
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
