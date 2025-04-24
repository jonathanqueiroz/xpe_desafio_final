class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  before_validation :set_unit_price
  after_create :update_product_stock
  after_destroy :restore_product_stock

  private

  def set_unit_price
    self.unit_price = product.price if product && unit_price.nil?
  end

  def update_product_stock
    product.update!(stock: product.stock - quantity)
  end

  def restore_product_stock
    product.update!(stock: product.stock + quantity)
  end
end
