require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe '#taggings' do
    let(:tag) { Tag.create(name: 'music') }

    it 'will respond to .taggings' do
      expect(tag).to respond_to(:taggings)
    end
  end

  describe '#articles' do
    let(:tag) { Tag.create(name: "ruby") }

    it 'will respond to .articles' do
      expect(tag).to respond_to(:articles)
    end
  end
end
