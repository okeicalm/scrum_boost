# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductBacklog, type: :model do
  describe 'Association' do
    it { is_expected.to belong_to(:project) }
  end

  describe 'Validation' do
    subject { create(:product_backlog) }

    it { is_expected.to validate_uniqueness_of(:project) }
  end
end
