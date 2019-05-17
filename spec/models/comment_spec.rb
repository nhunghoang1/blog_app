require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#article' do
    let(:article) { Article.create title: 'hello', text: 'hello' }
    let(:comment) { Comment.create article: article }

    it 'will respond to .article' do
      expect(comment).to respond_to(:article)
    end
  end
end
