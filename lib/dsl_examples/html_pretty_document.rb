module DslExamples
  class HtmlPrettyDocument
    class HtmlTag
      TAGS = %w(html head body title
                a p br hr b i
                h1 h2 h3 h4 h5 h6
                div span
                table thead th tbody tr td
                style).freeze

      def initialize(tag, text: '', attributes: {})
        @tag = tag
        @text = text
        @attributes = attributes
        @children = []
      end

      TAGS.each do |tag|
        define_method(tag) do |text: '', attributes: {}, &block|
          element = HtmlTag.new(tag, text: text, attributes: attributes)
          @children << element
          element.instance_exec(&block) if block
        end
      end

      def to_html
        if empty?
          "<#{@tag} #{html_attributes} />"
        else
          "<#{@tag} #{html_attributes}>#{@text}#{child_html}</#{@tag}>"
        end
      end

      def empty?
        (!@children || @children.empty?) && (!@text || @text.empty?)
      end

      private

      def child_html
        @children.map(&:to_html).join('')
      end

      def html_attributes
        @attributes.map { |attr, value| "#{attr}=\"#{value}\"" }.join(' ')
      end
    end

    def initialize
      @html = HtmlTag.new(:html)
      body
    end

    def body
      raise NotImplementedError
    end

    def html(&block)
      @html.instance_exec(&block)
    end

    def to_html
      @html.to_html
    end
  end
end