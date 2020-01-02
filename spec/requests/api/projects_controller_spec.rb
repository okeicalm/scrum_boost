# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::ProjectsController, type: :request do
  describe 'GET /api/projects' do
    include_context 'with user and auth headers'

    subject { get '/api/projects', headers: auth_headers }

    before(:each) { create_list(:project, 3, :with_product_backlog) }

    it do
      subject
      expect(response.status).to eq 200
      actual_data = JSON.parse(response.body)
      expect(actual_data.first).to include('id', 'name', 'user_id', 'created_at', 'updated_at')
      expect(actual_data.count).to eq 3
    end
  end

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
