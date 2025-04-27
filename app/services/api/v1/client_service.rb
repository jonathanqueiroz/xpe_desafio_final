module Api
  module V1
    class ClientService
      def find_all
        Client.all
      end

      def find_by_id(id)
        Client.find(id)
      end

      def search_by_name(name)
        Client.where("name ILIKE ?", "%#{name}%")
      end

      def create(params)
        Client.create!(params)
      end

      def update(client, params)
        client.update!(params)
        client
      end

      def destroy(client)
        client.destroy
      end

      def count
        Client.count
      end
    end
  end
end
