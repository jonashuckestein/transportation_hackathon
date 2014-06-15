class GroupsController < ApplicationController

  respond_to :json

  def request_ride
    user = User.new(user_params)
    user.profile_image = "empty.jpeg"
    user.leave_before = user.leave_after + 1.hour
    user.save!
    @group = user.group
  end

  def index
    @groups = Group.all
  end

private
  def user_params
    params.require(:user).permit(:name, :leave_after, :leave_before, :destination_address, :has_car, :car_spots)
  end
end
