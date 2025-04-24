module Api
  module V1
    class ProductsController < BaseController
      before_action :set_product, only: [:show, :update, :destroy]

      def index
        @products = product_service.list_all
        render json: ProductDto.collection(@products)
      end

      def count
        render json: { count: product_service.count }
      end

      def search
        @products = product_service.search(params[:name])
        render json: ProductDto.collection(@products)
      end

      def show
        render json: ProductDto.new(@product).call
      end

      def create
        @product = product_service.create(product_params)
        render json: ProductDto.new(@product).call, status: :created
      end

      def update
        @product = product_service.update(@product, product_params)
        render json: ProductDto.new(@product).call
      end

      def destroy
        product_service.destroy(@product)
        head :no_content
      end

      private

      def product_service
        @product_service ||= ProductService.new
      end

      def set_product
        @product = product_service.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:name, :description, :price, :stock)
      end
    end
  end
end
