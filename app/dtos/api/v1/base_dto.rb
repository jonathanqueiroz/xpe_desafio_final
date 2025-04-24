module Api
  module V1
    class BaseDto
      def self.call(*args)
        new(*args).call
      end
    end
  end
end
