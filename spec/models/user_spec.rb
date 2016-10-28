require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user)         { build(:user) }
    let(:invalid_user) { build(:invalid_user) }

    context 'an invalid user' do
      before do
        invalid_user.valid?
      end

      it 'has no name' do
        expect(invalid_user.errors.messages[:name]).to include "can't be blank"
      end

      it 'has no password' do
        expect(invalid_user.errors.messages[:password]).to include "can't be blank"
      end

      it 'has a password which is too long' do
        invalid_user.password = 'a' * 100
        invalid_user.password_confirmation = 'a' * 100
        invalid_user.valid?
        expect(invalid_user.errors.messages[:password]).to include "is too long (maximum is 72 characters)"
      end

      it 'has a password confirmation mismatch' do
        invalid_user.password = 'b'
        invalid_user.password_confirmation = 'a'
        invalid_user.valid?
        expect(invalid_user.errors.messages[:password_confirmation]).to include "doesn't match Password"
      end
    end

    context 'a valid user' do
      it 'has a name and a password' do
        expect(user).to be_valid
      end
    end
  end
end
