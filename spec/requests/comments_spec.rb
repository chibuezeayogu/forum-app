# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Comments", type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }
  let(:comment) { create(:comment, user: user) }

  before { sign_in user }

  describe "POST /posts/:post_id/comments" do
    let(:comment_build) { build(:comment, post: post, user: user) }

    context "when a signed in user adds a comment and clicks the create comment button" do
      it "should create comment and render show post view" do
        # post "/posts/#{comment_build.post_id}/comments", params: { comment: { comment: Faker::Lorem.paragraph } }

        # expect(response).to have_http_status(:found)
        # expect(response).to redirect_to(post)
      end
    end
  end

  describe "PUT /posts/:post_id/comments/:id" do
    context "when a user is signed in adds a comment and click the create comment button" do
      it "should create comment and render show post view" do
        put "/posts/#{comment.post_id}/comments/#{comment.id}", params: { comment: { comment: Faker::Lorem.paragraph } }

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(comment.post)
      end
    end
  end

  describe "DELETE /posts/:post_id/comments/:id" do
    context "when a user is signed in adds a comment and click the create comment button" do
      it "should create comment and render show post view" do
        delete "/posts/#{comment.post_id}/comments/#{comment.id}", params: { comment: { comment: Faker::Lorem.paragraph } }

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(comment.post)
      end
    end
  end
end
