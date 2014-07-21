require 'gir_ffi-gtk3'
require 'celluloid'

# TODO: move this to an adapter so the GUI can do MySQL/SQLite3 too.
require 'pg'

GirFFI.setup :GtkSource

require_relative 'sql-gui/sql_gui'
require_relative 'sql-gui/main_window'
require_relative 'sql-gui/sql_editor'
require_relative 'sql-gui/query_result'
require_relative 'sql-gui/connection'
require_relative 'sql-gui/connection/base'
require_relative 'sql-gui/connection/postgresql'
