# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ontorave_session',
  :secret      => 'a28cf945a421f761d51b3b5084b70c63f7cc5a4ad911e25f594d1cbac640dda0888cfe9c213a3a9869eecc3092c81272f02beccd82d81308bc41470d0f93640c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store

