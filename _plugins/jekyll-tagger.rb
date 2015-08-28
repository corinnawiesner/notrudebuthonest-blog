require 'ostruct'

module Tagger
  class Generator < Jekyll::Generator

    attr_reader :site

    def generate(site)
      @site = site
      site.data['tagger_tag_list'] = generate_tag_list(site)
      site.data['tagger_data'] = generate_data(site)
    end

    def generate_tag_list(site)
      site.tags.keys.sort
    end

    def generate_data(site)
      tag_data = Hash.new

      for tag in generate_tag_list(site) do
        tag_data[tag] = OpenStruct.new(post_count: post_count_for_tag(tag))
      end

      return tag_data
    end

    def post_count_for_tag(tag)
      count = site.tags[tag].size
    end
  end

  class TagIndex < Jekyll::Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag_index.html')
      self.data['tag'] = tag
      tag_title_prefix = site.config['tag_title_prefix'] || 'Posts Tagged &ldquo;'
      tag_title_suffix = site.config['tag_title_suffix'] || '&rdquo;'
      self.data['title'] = "#{tag_title_prefix}#{tag}#{tag_title_suffix}"
    end
  end

  class TagGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'tag_index'
        dir = site.config['tag_dir'] || 'tags'
        site.tags.keys.each do |tag|
          write_tag_index(site, File.join(dir, tag), tag)
        end
      end
    end

    def write_tag_index(site, dir, tag)
      index = TagIndex.new(site, site.source, dir, tag)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end
  end
end
