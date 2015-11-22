# Be sure to restart your server when you modify this file.

HomeCook::Application.config.session_store :cookie_store, key: '_HomeCook_session', :expire_after => 24.hours

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# HomeCook::Application.config.session_store :active_record_store
