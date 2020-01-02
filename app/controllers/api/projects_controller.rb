# frozen_string_literal: true

class Api::ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
    render json: @projects.to_json
  end

  def create
    project_creator = Project::Creator.new(
      name: project_params[:name],
      description: project_params[:description],
      user: current_user,
    )
    if project_creator.execute
      render json: project_creator.project.to_json
    else
      render json: error_json(messages: project_creator.errors.full_messages), status: :bad_request
    end
  end

  private

  def project_params
    params.permit(:name, :description)
  end
end
