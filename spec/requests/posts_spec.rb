# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Posts", type: :request do
  let(:user) { create(:user) }

  describe "GET /index" do
    it "should render index view" do
      get "/posts", params: {}

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
    end
  end

  describe "GET /posts/new" do
    before { sign_in user }

    context "when a signed in user clicks the New Post button" do
      it "should render new view" do
        get "/posts/new", params: {}

        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "POST /posts" do
    before { sign_in user }

    context "when a signed in user adds title and content and clicks the Create Post button" do
      it "should create post and redirect to index view" do
        post "/posts", params: { post: { title: Faker::Lorem.word, content: Faker::Lorem.paragraph } }

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "GET /posts/:id" do
    let(:post) { create(:post) }

    context "when a signed in user clicks on a post on Hope page " do
      it "should render show view with the clicked post" do
        get "/posts/#{post.id}", params: {}

        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:show)
      end
    end
  end

  describe "PUT /post/:id" do
    before { sign_in user }
    let(:post) { create(:post) }

    context "when a signed in user updates a post" do
      it "should update the records and render show view" do
        put "/posts/#{post.id}", params: { post: { content: Faker::Lorem.paragraph } }

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(post_path(post))
      end
    end
  end

  describe "DELETE /post/:id" do
    before { sign_in user }
    let(:post) { create(:post) }

    context "when a signed in user clickes the delete post button" do
      it "should delete the post and render index view" do
        delete "/posts/#{post.id}", params: {}

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
