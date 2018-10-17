module DslExamples
  class MyPrettyDocument < HtmlPrettyDocument
    def body
      html do
        head do
          title text: 'Hello world'

          style text: <<-CSS
              table, tr, td {
                border: 1px solid red
              }
            CSS
        end

        body do
          h1 text: 'Hello world'

          table do
            thead do
              tr do
                td text: 'Social network'
                td text: 'Search engine'
              end
            end

            tbody do
              tr do
                td do
                  a text: 'Facebook',
                    attributes: { href: 'https://facebook.com' }
                end

                td do
                  a text: 'Google',
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