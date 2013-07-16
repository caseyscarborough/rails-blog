# = User
#
# This model represents a user in the system. Users currently
# have the attributes first_name, last_name, email, username,
# and is_admin.

class User < ActiveRecord::Base
  has_secure_password
end
