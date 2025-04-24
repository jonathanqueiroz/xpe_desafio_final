module Api
  module V1
    class ClientDto < BaseDto
      def initialize(client)
        @client = client
      end

      def call
        {
          id: @client.id,
          name: @client.name,
          email: @client.email,
          cpf: @client.cpf,
          created_at: @client.created_at,
          updated_at: @client.updated_at
        }
      end

      def self.collection(clients)
        clients.map { |client| new(client).call }
      end
    end
  end
end
