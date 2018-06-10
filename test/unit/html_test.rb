require File.expand_path("../test_helper", File.dirname(__FILE__))

class HTMLBase < Test::Unit::TestCase
	def test_dummy; end

	def self.behaves_as_basic_html
		# Simple methods =========================================================
		test "div should return content with given attributes" do
			assert_equal %Q{<div class="green">Hello</div>}, @object.div("Hello", :class => "green")
		end

		test "div should return content in block with given attributes" do
			assert_equal %Q{<div class="green">Hello</div>}, @object.div(:class => "green") { "Hello" }
		end

		test "div should return non string content" do
			assert_equal %Q{<div>1234</div>}, @object.div(1234)
		end

		test "div should not be self closing" do
			assert_equal %Q{<div></div>}, @object.div
		end

		test "div should not be self closing with nil block" do
			assert_equal %Q{<div></div>}, @object.div { nil }
		end

		test "div should return closing tag without content" do
			assert_equal %Q{<div class="green"></div>}, @object.div(:class => "green")
		end

		test "a should return anchor with given attributes" do
			assert_equal %Q{<a href="http://example.org">link</a>}, @object.a("link", :href => "http://example.org")
		end

		test "title should return title with content" do
			assert_equal %Q{<title>Hello</title>}, @object.title("Hello")
		end

		test "h1 should return h1 header" do
			assert_equal %Q{<h1>Title</h1>}, @object.h1("Title")
		end

		test "br should be self closing" do
			assert_equal %Q{<br/>}, @object.br
		end

		test "br should not accept block content" do
			assert_equal %Q{<br/>}, @object.br { "foo" }
		end

		# Streaming ==============================================================
		test "html should product stream of strings if object responds to arrows" do
			@streaming_object.instance_eval do
				html do
					head do
						title "Hi"
					end
				end
			end
			assert_equal ["<html>", "<head>", "<title>", "Hi", "</title>", "</head>", "</html>"], @streaming_object
		end

		# Examples ===============================================================
		test "complex nested build calls should render correctly" do
			assert_equal %Q{<html>} +
			%Q{<head><title>my document</title><link href="style.css" rel="stylesheet" type="text/css"/></head>} +
			%Q{<body class="awesome"><div><div><table cellspacing="0">} +
			%Q{<tr><th>Col 1</th><th>Col 2</th></tr>} +
			%Q{<tr><td>10000</td><td>content</td></tr>} +
			%Q{</table></div></div></body>} +
			%Q{</html>}, @object.instance_eval {
				html do
					head do
						title "my document"
						link :href => "style.css", :rel => :stylesheet, :type => "text/css"
					end
					body :class => :awesome do
						div {
							div {
								table :cellspacing => 0 do
									tr {
										th "Col 1"
										th "Col 2"
									}
									tr {
										td 10_000
										td "content"
									}
								end
							}
						}
					end
				end
			}
		end

		# Builders ===============================================================
		test "builder should build html" do
			out = @html::Builder.build do |b|
				b.html do
					b.head do
						b.title "my document"
						b.link :href => "style.css", :rel => :stylesheet, :type => "text/css"
					end
					b.body :class => :awesome do
						b.div {
							b.div {
								b.table :cellspacing => 0 do
									b.tr {
										b.th "Col 1"
										b.th "Col 2"
									}
									b.tr {
										b.td 10_000
										b.td "content"
									}
								end
							}
						}
					end
				end
			end
			assert_equal %Q{<html>} +
			%Q{<head><title>my document</title><link href="style.css" rel="stylesheet" type="text/css"/></head>} +
			%Q{<body class="awesome"><div><div><table cellspacing="0">} +
			%Q{<tr><th>Col 1</th><th>Col 2</th></tr>} +
			%Q{<tr><td>10000</td><td>content</td></tr>} +
			%Q{</table></div></div></body>} +
			%Q{</html>}, out
		end
	end
end

class HTML5Test < HTMLBase
	def setup
		@html = html = Crafty::HTML5
		@object = Class.new { include html::Basic }.new
		@streaming_object = Class.new(Array) { include html::Basic }.new
	end

	def self.behaves_as_html_5


		test "main should return main element" do
			assert_equal %Q{<main>content</main>}, @object.main("content")
		end

		test "header should return header element" do
			assert_equal %Q{<header>content</header>}, @object.header("content")
		end
	end
	behaves_as_basic_html
end

class HTML4Test < HTMLBase
	def setup
		@html = html = Crafty::HTML4
		@object = Class.new { include html::Basic }.new
		@streaming_object = Class.new(Array) { include html::Basic }.new
	end

	behaves_as_basic_html
end

class HTMLAliasTest < Test::Unit::TestCase
	test "html should equal html5" do
		assert_equal Crafty::HTML, Crafty::HTML5
	end

	test "xhtml should equal html4" do
		assert_equal Crafty::XHTML, Crafty::HTML4
	end
end
