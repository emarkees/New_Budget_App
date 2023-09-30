require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Abiola', email: 'yemi@tester.com', password: '1234test') }

  context '#validation' do
    it 'should accept name, email, password, and role and save them to the database' do
      expect(subject).to be_valid
    end

    it 'should validate_presence_of(:name)' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should validate_presence_of(:email)' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'should validate_format_of(:email)' do
      subject.email = 'invalid_email'
      expect(subject).to_not be_valid
    end

    it 'should validate_presence_of(:password)' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

  end
end
