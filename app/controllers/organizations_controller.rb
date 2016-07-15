class OrganizationsController < ApplicationController
  def index
    @organization = Organization.last
    render json: @organization
  end
end
