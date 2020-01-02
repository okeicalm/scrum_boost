# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'Association' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_one(:product_backlog).dependent(:destroy) }
  end

  describe 'Validation' do
    describe 'name' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_most(100) }
    end
  end

  describe 'description' do
    it { is_expected.to validate_length_of(:description).is_at_most(1000) }
  end
end
