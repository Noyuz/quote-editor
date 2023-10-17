class Quote < ApplicationRecord
  belongs_to :company
  has_many :line_item_dates, dependent: :destroy

  validates :name, presence: true

  # after_create_commit -> { broadcast_prepend_to "quotes" }
  # after_update_commit -> { broadcast_replace_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }
  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend

  scope :ordered, -> { order(id: :desc) }

end
