require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Article Validation' do
    context 'when a title is not present' do
      it 'will not save the article' do
        expect(Article.create(title: nil).errors.messages[:title]).to include("can't be blank")
      end
    end

    context 'when a title is less than 5 characters' do
      let(:article) { Article.create(title: 'hi') }
      it 'will not save the article' do
        expect(article.errors.messages[:title]).to include("is too short (minimum is 5 characters)")
      end
    end

    describe '#comments' do
      let(:article) { FactoryBot.create(:article) }

      it 'will respond to .comments' do
        expect(article).to respond_to(:comments)
      end

      context 'when delete an article' do
        before do
          5.times do |i|
            FactoryBot.create(:comment, article: article)
          end
        end

        it 'will destroy all the comments of the article' do
          expect(article.comments.length).to eq(5)
          article.destroy 
          expect(Comment.all.length).to eq(0)
        end
      end
    end
  end
end
