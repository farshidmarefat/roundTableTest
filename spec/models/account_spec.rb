require 'rails_helper'

RSpec.describe Account, :type => :model do
  subject {
    described_class.new(name: 'Nima Ghanbari', email: 'nima.ghanbari@gmail.com', mobile: '09123212222')
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a mobile" do
    subject.mobile = nil
    expect(subject).to_not be_valid
  end

  it 'checks that an account can be updated' do
    subject.update(:name => "Nima Ghanbari Pasha")
    expect(Account.find_by_name("Nima Ghanbari Pasha")).to eq(subject)
  end

  it 'checks that a song can be destroyed' do
    subject.destroy
    expect(Account.count).to eq(0)
  end
end
