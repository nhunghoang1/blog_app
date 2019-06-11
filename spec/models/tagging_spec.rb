require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe '#tag' do
    let(:tagging) { Tagging.create }

    it 'will respond to .tag' do
      expect(tagging).to respond_to(:tag)
    end
  end

  describe '#article' do
    let(:tagging) { Tagging.create }

    it 'will respond to .article' do
      expect(tagging).to respond_to(:article)
    end
  end
end
