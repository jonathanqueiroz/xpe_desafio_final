module Api
  module V1
    class ClientService
      def list_all
        Client.all
      end

      def find(id)
        Client.find(id)
      end

      def search(name)
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
