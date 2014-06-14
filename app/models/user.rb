class User < ActiveRecord::Base

  validates :name, :profile_image, :leave_after, :leave_before, :destination_address, presence: true
  belongs_to :group

  def matched?
    group_id.present?
  end

  def determine_group
    self.group = Group.first
    save!
  end

end
