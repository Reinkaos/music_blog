require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    let(:valid_post)   { build(:post) }
    let(:invalid_post) { build(:invalid_post) }

    context 'an invalid post' do
      before do
        invalid_post.valid?
      end

      it 'has no title' do
        expect(invalid_post.errors.messages[:title]).to include "can't be blank"
      end

      it 'has no body' do
        expect(invalid_post.errors.messages[:body]).to include "can't be blank"
      end
    end

    context 'a valid post' do
      it 'has a title and a body' do
        expect(valid_post).to be_valid
      end
    end
  end
end
