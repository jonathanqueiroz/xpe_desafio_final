class Order < ApplicationRecord
  belongs_to :client
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  accepts_nested_attributes_for :order_items, allow_destroy: true

  enum :status, { pending: "pending", completed: "completed", canceled: "canceled" }

  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :client_id, presence: true

  before_create :set_default_status
  after_commit :calculate_total_amount, on: [ :create, :update ]

  private

  def calculate_total_amount
    self.total_amount = order_items.sum { |item| item.quantity * item.unit_price }

    save if total_amount_changed?
  end

  def set_default_status
    self.status ||= :pending
  end
end
