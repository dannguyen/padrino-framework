begin
  require 'haml'
  require 'haml/helpers/xss_mods'

  module Haml
    module Helpers
      include XssMods
    end

    module Util
      def self.rails_xss_safe?
        true
      end
    end
  end

  if defined? Padrino::Rendering
    Padrino::Rendering.engine_configurations[:haml] =
      {:escape_html => true}

    class Tilt::HamlTemplate
      include Padrino::Rendering::SafeTemplate
    end
  end
rescue LoadError
end
