require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#articles" do
    let(:user) {User.create(email: 'nhung@example.com', password: 'secret')}
    it 'will respond to .articles' do 
      expect(user).to respond_to(:articles)
    end


    context 'when delete an user' do
      before do
        5.times do |i|
          Article.create(user:user)
        end
      end
      it 'will destroy all the articles of the user' do
       expect(user.articles.length).to eq(5)
       user.destroy
       expect(Article.all.length).to eq(0)
      end
    end
  end
end
