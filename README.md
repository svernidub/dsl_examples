# DslExamples

Simple Ruby DSL examples

## How to build DSL via class methods

Not real DSL exactly, but simple example how to use class methods to build DSL.

Simple
[extention](https://github.com/svernidub/dsl_examples/blob/master/lib/dsl_examples/hexdigest.rb)
that allows to create digest helper for any method.

```ruby
class ClassWithHexDigests
  extend Hexdigest

  attr_reader :first_name,
                :last_name

  hexdigest_for :first_name, Digest::MD5
  hexdigest_for :last_name,  Digest::SHA2
end

obj = ClassWithHexDigests.new('Serhii', 'Vernydub')

cwh.first_name           # => "Serhii"
cwh.first_name_hexdigest # => "9ca31108f5130ccdff3bfb598a1d4966"
cwh.last_name            # => "Vernydub"
cwh.last_name_hexdigest  # => "0c0813b27c693bac5dc97ea8200d221f9a56bb9a9b0459b1cd915901ebb2d425"
```

## How to build DSL via methods and blocks

[Class](https://github.com/svernidub/dsl_examples/blob/master/lib/dsl_examples/html_document.rb)
 `HtmlDocument` provides ability to describe HTML documents with DSL.

```ruby
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
  end
end
```

### Improved syntax

[Class](https://github.com/svernidub/dsl_examples/blob/master/lib/dsl_examples/html_pretty_document.rb)
`HtmlPrettyDocument` is copy of `HtmlDocument` but it has one simple but useful improvement.
It allows us not to pass block parameter to every nested HTML-tag.

```ruby
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
  end
end
```