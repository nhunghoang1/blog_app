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

    describe '#picture' do
      let(:article) { FactoryBot.create(:article) }

      it 'will respond to .picture' do
        expect(article).to respond_to(:picture)
      end
    end

    describe '#user' do
      let(:article) { FactoryBot.create(:article) }

      it 'will respond to .user' do
        expect(article).to respond_to(:user)
      end
    end

    describe '#tags' do
      let(:article) { FactoryBot.create(:article) }

      it 'will respond to .tags' do
        expect(article).to respond_to(:tags)
      end
    end

    describe '#taggings' do
    let(:article) { FactoryBot.create(:article) }

      it 'will respond to .taggings' do
        expect(article).to respond_to(:taggings)
      end
    end

    describe '#tag_list' do
    let(:article) { FactoryBot.create(:article) }
    let(:tag1) { Tag.create(name: 'music') }
    let(:tag2) { Tag.create(name: 'ruby') }

      it 'will show the tag list' do
        article.tag_list = [tag1, tag2]
        article.tag_list.save
    
        expect(article.tag_list).to eq("music, ruby")
      end
    end

    describe '#tagged_with' do
      let(:article) { FactoryBot.create(:article) }
      let(:tag) { Tag.create(name: 'music') }
      it 'will show the tags that associated with the article' do
        article.tags.save
        expect(article.tags).to eq('music')
      end
    end

    describe '#tag_counts' do
      it 'will'
    end
  end
end
