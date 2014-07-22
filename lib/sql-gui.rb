require 'gir_ffi-gtk3'
require 'celluloid'

GirFFI.setup :GtkSource

require_relative 'sql-gui/sql_gui'
require_relative 'sql-gui/pango'
require_relative 'sql-gui/main_window'
require_relative 'sql-gui/sql_editor'
require_relative 'sql-gui/query_result'
require_relative 'sql-gui/connection_manager'
require_relative 'sql-gui/connection'
require_relative 'sql-gui/connection/postgresql'
require_relative 'sql-gui/connection/sqlite3'
