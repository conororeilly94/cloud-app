class Property < ApplicationRecord
    # mount_uploader :image, ImageUploader
    has_one_attached :image
    belongs_to :account

    scope :latest, -> { order created_at: :desc }
end
