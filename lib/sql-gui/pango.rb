module Pango
  module Lib
    ellipsize_members = [
      :PANGO_ELLIPSIZE_NONE,
      :PANGO_ELLIPSIZE_START,
      :PANGO_ELLIPSIZE_MIDDLE,
      :PANGO_ELLIPSIZE_END
    ]

    enum(:PangoEllipsizeMode, ellipsize_members)

    ellipsize_members.each do |name|
      const_set(name, enum_value(name))
    end
  end # Lib
end # Pango

