module Timestamp
  extend ActiveSupport::Concern

  included do
    field :created_at, type: DateTime
    field :updated_at, type: DateTime

    before_create :set_created_at
    after_save :set_updated_at
  end

  private

  def set_created_at
    self.created_at = Time.now
  end

  def set_updated_at
    self.updated_at = Time.now
  end
end
