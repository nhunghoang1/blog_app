require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#articles" do
    let(:user) { FactoryBot.create(:user) }
    let(:article) { FactoryBot.create(:article) }

    it 'will respond to .articles' do 
      expect(user).to respond_to(:articles)
    end


    context 'when deleting a user' do
      before do
        5.times do |i|
          article = FactoryBot.create(:article, user: user)
          FactoryBot.create(:comment, article: article, user: user)

        end
      end

      it 'will destroy all the articles of the user' do
       expect(user.articles.length).to eq(5)
       user.destroy
       expect(Article.all.length).to eq(0)
      end

      it 'will destroy all the comments of the user' do
        expect(user.comments.length).to eq(5)
        user.destroy
        expect(User.all.length).to eq(0)
      end
    end
  end

  describe 'User validation' do
    context 'when an email is not present' do
      it 'will not save the user' do
        expect(User.create(email: nil).errors.messages[:email]).to include("can't be blank")
      end
    end
  end
end
