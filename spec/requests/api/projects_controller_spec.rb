# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::ProjectsController do
  describe 'GET /api/projects' do
    subject { get '/api/projects', headers: auth_headers }

    include_context 'with user and auth headers'

    before(:each) do
      create_list(:project, 3, :with_product_backlog, user: user)
      create(:project, :with_product_backlog)
    end

    it do
      expect(subject).to eq 200
      actual_data = JSON.parse(response.body)
      expect(actual_data.first).to include('id', 'name', 'user_id', 'created_at', 'updated_at')
      expect(actual_data.count).to eq 3
    end
  end

  describe 'POST /api/projects' do
    subject { post '/api/projects', params: params, headers: auth_headers }

    include_context 'with user and auth headers'

    let(:params) do
      {
        name: 'Project name',
        description: 'Project description',
      }.to_json
    end

    it { is_expected.to eq 200 }
    it { expect { subject }.to change(Project, :count).by(1) }
  end
end
