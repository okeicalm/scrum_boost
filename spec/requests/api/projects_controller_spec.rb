# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::ProjectsController, type: :request do
  describe 'POST /api/projects' do
    include_context 'with user and auth headers'

    subject { post '/api/projects', params: params, headers: auth_headers }

    let(:params) do
      {
        name: 'Project name',
        description: 'Project description',
      }.to_json
    end

    it do
      subject
      expect(response.status).to eq 200
    end
  end
end
