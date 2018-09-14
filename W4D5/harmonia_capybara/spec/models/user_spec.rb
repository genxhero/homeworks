require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password > 7) }
  it { should validate_exclusion_of(:password, in: ["password", "Password"] ) }

end
