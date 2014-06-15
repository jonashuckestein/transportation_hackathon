class User < ActiveRecord::Base

  validates :name, :profile_image, :leave_after, :leave_before, :destination_address, presence: true

  geocoded_by :destination_address, latitude: :dest_lat, longitude: :dest_long

  before_validation :improve_address

  after_validation :geocode

  belongs_to :group

  def improve_address # so google can find it
    if destination_address.present? &&
      !destination_address.include?("Berlin") &&
      !destination_address.include?("berlin")
      self.destination_address += ", Berlin, Germany"
    end
  end

  def matched?
    group_id.present?
  end

  def determine_group
    self.group = Group.closest(destination_address)
    save!
  end
end
