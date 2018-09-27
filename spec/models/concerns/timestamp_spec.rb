require 'rails_helper'

RSpec.describe Timestamp, type: :concern do
  include ActiveSupport::Testing::TimeHelpers

  class Foo
    include Mongoid::Document
    include Timestamp
  end

  describe 'set_created_at' do
    it 'on create' do
      foo = Foo.create
      expect(foo.created_at).to be_present
    end

    it 'on first save' do
      foo = Foo.new
      foo.save
      expect(foo.created_at).to be_present
    end

    context 'on next saves' do
      it 'not change' do
        foo = Foo.create
        previous_created_at = foo.created_at

        travel 1.day do
          foo = Foo.last
          foo.save
        end

        expect(foo.created_at.to_i).to eq(previous_created_at.to_i)
      end
    end
  end

  describe 'set_updated_at' do
    it 'on create' do
      foo = Foo.create
      expect(foo.updated_at).to be_present
    end

    it 'on first save' do
      foo = Foo.new
      foo.save
      expect(foo.updated_at).to be_present
    end

    context 'on next saves' do
      it 'not change' do
        foo = Foo.create
        previous_updated_at = foo.updated_at

        travel 1.day do
          foo = Foo.last
          foo.save
        end

        expect(foo.updated_at.to_i).to be > previous_updated_at.to_i
      end
    end
  end
end
