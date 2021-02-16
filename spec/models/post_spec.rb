# frozen_string_literal: true

require "rails_helper"

RSpec.describe Post, type: :model do
  describe "ActiveRecord Associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_rich_text(:content) }
  end
end
