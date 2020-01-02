# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project::Creator, type: :model do
  describe 'Validation' do
    describe 'user' do
      it { is_expected.to validate_presence_of(:user) }
    end

    describe 'name' do
      it { is_expected.to validate_presence_of(:name) }
    end
  end

  describe '#execute' do
    subject { project_creator.execute }

    let(:project_creator) { described_class.new(user: user, name: name, description: description) }
    let(:user) { create(:user) }
    let(:name) { Faker::Vehicle.manufacture }
    let(:description) { Faker::Subscription }

    context 'when creator has valid attributes' do
      it { is_expected.to eq true }

      it do
        expect { subject }
          .to change(Project, :count).by(1)
          .and change(ProductBacklog, :count).by(1)
      end
    end

    context 'when creator does not has valid attributes' do
      before(:each) do
        allow(project_creator).to receive(:invalid?).and_return(true)
      end

      it { is_expected.to eq false }
    end

    context 'when exception is raised' do
      let(:record_invalid) { ActiveRecord::RecordInvalid.new }

      before(:each) do
        allow(record_invalid).to receive_message_chain(:record, :errors, :full_messages).and_return(['error'])
        allow(project_creator).to receive(:invalid?).and_return(false)
        allow(project_creator).to receive(:persist!).and_raise(record_invalid)
      end

      it { is_expected.to eq false }

      it do
        subject
        expect(project_creator.errors.full_messages).to eq ['error']
      end
    end
  end
end
