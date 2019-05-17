require 'rails_helper'

RSpec.describe "Article", type: :request do
  describe 'requires login' do
    it 'GET /articles/new' do
      get new_article_path
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'GET /articles/1/edit' do
      get edit_article_path(1)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'PATCH /articles/1' do
      patch article_path(1, article: { title: 'Hellllllllo' } )
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)

    end

    it 'DELETE /articles/1' do
      delete article_path(1)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'logged in' do
    before { login_user }

    it 'GET /articles/new' do
      get new_article_path
      expect(response).to have_http_status(200)
    end

    it 'POST /articles' do
      post articles_path(article: { title: 'A new article' } )
      expect(response).to redirect_to(assigns(:article))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include("A new article")
    end

    it 'GET /articles/1/edit' do
      article = Article.create(title: 'hello hello')
      get edit_article_path(article)
      expect(response).to have_http_status(200)
    end

    context 'PATCH /articles/1' do
      let(:article) { Article.create(title: 'Hello') }
  
        it "returns a valid response" do
          patch article_path(article.to_param, article: { title: 'Hellllllllo' } )
          expect(response).to redirect_to(assigns(:article))
          follow_redirect!
  
          expect(response).to render_template(:show)
          expect(response.body).to include('Hellllllllo')
        end
    end

    it 'DELETE /articles/1' do
      article = Article.create(title: 'hello nhung')
      delete article_path(article.to_param)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(articles_path)
    end
  end
end