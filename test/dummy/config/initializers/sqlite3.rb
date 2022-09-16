# frozen_string_literal: true

# This initializer configures SQLite to silence warnings and make sure the "database" is usable
# across all Rails versions the way a normal database is used during testing.

# Enforce booleans to represented as integers in the database.
# This was an old SQLite feature that we do not want to support anymore.
# Note: This is only for older versions of Sqlite3, the configuration option was dropped at some point
if ::Rails.application.config.active_record.sqlite3.respond_to?(:represent_boolean_as_integer)
  ::Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
end
