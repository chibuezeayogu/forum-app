# frozen_string_literal: true

require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "ActiveRecord Associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
    it { is_expected.to have_rich_text(:comment) }
  end
end
