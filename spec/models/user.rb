require "rails_helper"

RSpec.describe User, type: :model do
  describe "role methods" do
    let(:user) { User.new(role_id: role_id) }

    context "when the user has role_id 0" do
      let(:role_id) { 0 }

      it "returns true for member?" do
        expect(user.member?).to be_truthy
      end

      it "returns false for admin?" do
        expect(user.admin?).to be_falsey
      end
    end

    context "when the user has role_id 1" do
      let(:role_id) { 1 }

      it "returns false for member?" do
        expect(user.member?).to be_falsey
      end

      it "returns true for admin?" do
        expect(user.admin?).to be_truthy
      end
    end
  end
end
