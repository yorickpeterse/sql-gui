module SqlGui
  ##
  # Class for setting up a GTK SourceView for editing SQL queries.
  #
  class SqlEditor
    DEFAULT_FONT = 'DejaVu Sans Mono 10'

    def initialize(builder)
      @builder          = builder
      @editor           = builder.get_object('sql_editor')
      @language_manager = GtkSource::LanguageManager.new
      @scheme_manager   = GtkSource::StyleSchemeManager.new

      buffer.highlight_syntax = true

      self.language     = 'sql'
      self.style_scheme = 'solarized-light'
      self.font         = DEFAULT_FONT
    end

    def language=(name)
      buffer.language = @language_manager.get_language(name)
    end

    def style_scheme=(name)
      buffer.style_scheme = @scheme_manager.get_scheme(name)
    end

    def font=(name)
      @editor.modify_font(Pango::FontDescription.from_string(name))
    end

    def text
      return buffer.text
    end

    def buffer
      return @editor.get_buffer
    end
  end # SqlEditor
end # SqlGui
