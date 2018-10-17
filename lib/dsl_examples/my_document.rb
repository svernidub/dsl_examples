module DslExamples
  class MyDocument < HtmlDocument
    def body
      html do |h|
        h.head do |hd|
          hd.title text: 'Hello world'

          hd.style text: <<-CSS
              table, tr, td {
                border: 1px solid black
              }
            CSS
        end

        h.body do |b|
          b.h1 text: 'Hello world'

          b.table do |t|
            t.thead do |thd|
              thd.tr do |tr|
                tr.td text: 'Social network'
                tr.td text: 'Search engine'
              end
            end

            t.tbody do |tb|
              tb.tr do |tr|
                tr.td do |td|
                  td.a text: 'Facebook',
                       attributes: { href: 'https://facebook.com' }
                end

                tr.td do |td|
                  td.a text: 'Google',
                       attributes: { href: 'https://google.com' }
                end
              end
            end
          end
        end
      end
    end

    def self.test
      puts new.to_html
    end
  end
end