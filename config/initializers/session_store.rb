# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_remote_checkin_session',
  :secret      => 'ee7854bece62c28f8450204c53c4983bb17e4ea8ecfdfdab07376f62370de1e15b101f45a42e2abcae2b1dc0fb509e6861b102e12dd10277022274457c882141'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
