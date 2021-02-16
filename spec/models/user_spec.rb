# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "ActiveRecord Associations" do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:comments) }
  end
end
