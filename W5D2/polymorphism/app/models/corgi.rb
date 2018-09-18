class Corgi < ApplicationRecord
  has_many :toys, as :toyable
end

# and Cat models. These should both be named toys. Again, refer to the
# reading.
#
# Run rails db:seed. Check that your associations work as expected.
