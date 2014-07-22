module SqlGui
  ##
  # The MainWindow class displays the window that lets users write and run SQL
  # queries.
  #
  class MainWindow
    def initialize
      @builder = Gtk::Builder.new

      @builder.add_from_file(SqlGui.view(:main_window))

      @window     = @builder.get_object('main_window')
      @statusbar  = @builder.get_object('statusbar')
      @table      = @builder.get_object('sql_results')
      @run_button = @builder.get_object('run_query')
      @editor     = SqlEditor.new(@builder)
    end

    def run_query
      text = @editor.text.strip

      return if text.empty?

      @statusbar.push(statusbar_context, 'Running query...')

      future = SqlGui::Connection.schedule(1, text)
      prio   = GLib::PRIORITY_DEFAULT_IDLE

      GLib.idle_add(prio, proc { wait_for_query(future) }, nil, nil)
    end

    def wait_for_query(future)
      if future.ready?
        result = future.value

        display_result(result)

        @statusbar.remove_all(statusbar_context)

        return false
      else
        # `false` removes the idle callback.
        return true
      end
    end

    def display_result(result)
      if @table.get_n_columns > 0
        @table.get_columns.each do |column|
          @table.remove_column(column)
        end
      end

      types   = []
      columns = []

      result.columns.each_with_index do |name, index|
        column   = Gtk::TreeViewColumn.new
        renderer = Gtk::CellRendererText.new

        # TODO: handle multiple underscores
        column.title = name.gsub('_', '__')

        column.pack_start(renderer, false)
        column.add_attribute(renderer, 'text', index)

        column.resizable = true
        column.expand    = true

        renderer.editable      = true
        renderer.ellipsize     = Pango::Lib::PANGO_ELLIPSIZE_END
        renderer.ellipsize_set = true

        types   << GObject::TYPE_STRING
        columns << column
      end

      list = Gtk::ListStore.new(types)

      columns.each { |col| @table.append_column(col) }

      result.rows.each do |row|
        iter = list.append

        result.columns.each_with_index do |name, index|
          list.set_value(iter, index, row[name].to_s)
        end
      end

      @table.set_model(list)
    end

    def show
      configure_window
      configure_results_table
      configure_run_button

      @window.show_all
    end

    def configure_window
      @window.signal_connect('destroy') do
        Gtk.main_quit
      end
    end

    def configure_results_table
      @table.columns_autosize
    end

    def configure_run_button
      @run_button.signal_connect('clicked') { run_query }
    end

    def statusbar_context
      return @statusbar.get_context_id('status')
    end
  end # MainWindow
end # SqlGui
