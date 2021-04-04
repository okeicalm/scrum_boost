# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SprintBacklog, type: :model do
  describe 'Association' do
    it { is_expected.to belong_to(:product_backlog) }
  end

  describe 'Validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:initial_point_sum) }
    it { is_expected.to validate_presence_of(:point_sum) }
    it { is_expected.to validate_presence_of(:started_at) }
    it { is_expected.to validate_presence_of(:ended_at) }
  end
end
