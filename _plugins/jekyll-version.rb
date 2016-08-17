module Jekyll
  class RenderJekyllVersion < Liquid::Tag
    def initialize(tag_name, _, tokens)
      super
    end

    def render(context)
      ::Jekyll::VERSION
    end
  end
end

Liquid::Template.register_tag('jekyll_version', Jekyll::RenderJekyllVersion)
