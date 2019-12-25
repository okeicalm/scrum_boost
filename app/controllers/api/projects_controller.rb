# frozen_string_literal: true

class Api::ProjectsController < ApplicationController
  before_action :authenticate_user!

  def create
    @project = current_user.projects.new(
      name: project_params[:name],
      description: project_params[:description],
    )

    if @project.save
      # TODO: jbuilder使う
      render json: @project.to_json
    else
      render json: error_json(messages: @project.errors.full_messages)
    end
  end

  private

  def project_params
    params.permit(:name, :description)
  end
end
