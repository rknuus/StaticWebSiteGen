require 'test/unit'
require 'treetop'
require 'polyglot'

Treetop.load 'lib/webmarkup'

class TestWebmarkupParser < Test::Unit::TestCase
  def test_empty_file
    parser = WebMarkupParser.new
    result = parser.parse('')
    assert_equal('', result.content)
  end

  def test_files_with_only_a_single_newline
    parser = WebMarkupParser.new
    result = parser.parse("\n")
    assert_equal("\n", result.content)
  end

  def test_files_with_only_a_double_newline
    parser = WebMarkupParser.new
    result = parser.parse("\n\n")
    assert_equal("\n", result.content)
  end

  def test_files_with_only_a_triple_newline
    parser = WebMarkupParser.new
    result = parser.parse("\n\n\n")
    assert_equal("\n", result.content)
  end
  
  def test_mac_newlines
    parser = WebMarkupParser.new
    result = parser.parse("\r")
    assert_equal("\n", result.content)
  end
  
  def test_dos_newlines
    parser = WebMarkupParser.new
    result = parser.parse("\n\r")
    assert_equal("\n", result.content)
  end
  
  def test_header_only
    parser = WebMarkupParser.new
    result = parser.parse("= h1 =")
    assert_equal("<h1>h1</h1>", result.content)
  end
  
  def test_header_terminated_by_single_newline
    parser = WebMarkupParser.new
    result = parser.parse("= h1 =\n")
    assert_equal("<h1>h1</h1>", result.content)
  end
  
  def test_header_terminated_by_double_newline
    parser = WebMarkupParser.new
    result = parser.parse("= h1 =\n\n")
    assert_equal("<h1>h1</h1>", result.content)
  end
  
  def test_two_headers_separated_by_single_newline
    parser = WebMarkupParser.new
    result = parser.parse("= h1 =\n= h1 =")
    assert_equal("<h1>h1</h1>\n<h1>h1</h1>", result.content)
  end
  
  def test_two_headers_separated_by_double_newline
    parser = WebMarkupParser.new
    result = parser.parse("= h1 =\n\n= h1 =")
    assert_equal("<h1>h1</h1>\n<h1>h1</h1>", result.content)
  end
  
  def test_two_headers_separated_by_triple_newline
    parser = WebMarkupParser.new
    result = parser.parse("= h1 =\n\n\n= h1 =")
    assert_equal("<h1>h1</h1>\n<h1>h1</h1>", result.content)
  end
  
  def test_variable_header_text
    parser = WebMarkupParser.new
    result = parser.parse("=my funky header=")
    assert_equal("<h1>my funky header</h1>", result.content)
  end
  
  def test_symmetric_header_whitespaces_text
    parser = WebMarkupParser.new
    result = parser.parse("= my funky header =")
    assert_equal("<h1>my funky header</h1>", result.content)
  end

  def test_asymmetric_header_whitespaces
    parser = WebMarkupParser.new
    result = parser.parse("=my funky header =")
    assert_equal("<h1>my funky header</h1>", result.content)
    result = parser.parse("= my funky header=")
    assert_equal("<h1>my funky header</h1>", result.content)
  end
  
  def test_level2_header
    parser = WebMarkupParser.new
    result = parser.parse("== level 2 ==")
    assert_equal("<h2>level 2</h2>", result.content)
  end
  
  def test_header_level_mismatch
    parser = WebMarkupParser.new
    result = parser.parse("== level 2 =")
    assert_equal("", result.content)
    assert(/^Expected one of =/ =~ parser.failure_reason)
    result = parser.parse("= level 2 ==")
    assert_equal("", result.content)
    assert(/^Expected one of \n/ =~ parser.failure_reason)
  end
  
  def test_html_entities_in_header
    parser = WebMarkupParser.new
    result = parser.parse("= is a > 0 & a < 10? =")
    assert_equal("<h1>is a &gt; 0 &amp; a &lt; 10?</h1>", result.content)
  end
  
  def test_empty_preformatted
    parser = WebMarkupParser.new
    result = parser.parse("<nomarkupblock></nomarkupblock>")
    assert_equal("", result.content)
  end
  
  def test_preformatted_only
    parser = WebMarkupParser.new
    result = parser.parse("<nomarkupblock><em>foo</em> bar</nomarkupblock>")
    assert_equal("<em>foo</em> bar", result.content)
  end
  
  def test_preformatted_preserves_newlines
    parser = WebMarkupParser.new
    result = parser.parse("<nomarkupblock><em>foo</em>\n\n\nbar\nbaz</nomarkupblock>")
    assert_equal("<em>foo</em>\n\n\nbar\nbaz", result.content)
  end

  def test_pre_terminated_by_single_newline
    parser = WebMarkupParser.new
    result = parser.parse("<nomarkupblock>boo</nomarkupblock>\n")
    assert_equal("boo", result.content)
  end
  
  def test_pre_terminated_by_double_newline
    parser = WebMarkupParser.new
    result = parser.parse("<nomarkupblock>boo</nomarkupblock>\n\n")
    assert_equal("boo", result.content)
  end
  
  def test_two_pres_separated_by_double_newline
    parser = WebMarkupParser.new
    result = parser.parse("<nomarkupblock>foo</nomarkupblock>\n\n<nomarkupblock>boo</nomarkupblock>")
    assert_equal("foo\nboo", result.content)
  end
  
  def test_two_pres_separated_by_triple_newline
    parser = WebMarkupParser.new
    result = parser.parse("<nomarkupblock>foo</nomarkupblock>\n\n\n<nomarkupblock>boo</nomarkupblock>")
    assert_equal("foo\nboo", result.content)
  end
  
  def test_header_and_pre
    parser = WebMarkupParser.new
    result = parser.parse("= haha =\n<nomarkupblock>boo</nomarkupblock>")
    assert_equal("<h1>haha</h1>\nboo", result.content)
  end
  
  def test_pre_and_header
    parser = WebMarkupParser.new
    result = parser.parse("<nomarkupblock>boo</nomarkupblock>\n\n= haha =")
    assert_equal("boo\n<h1>haha</h1>", result.content)
  end
  
  def test_paragraph_only
    parser = WebMarkupParser.new
    result = parser.parse("just some text")
    assert_equal("<p>just some text</p>", result.content)
  end
  
  def test_paragraph_terminated_by_single_newline
    parser = WebMarkupParser.new
    result = parser.parse("just some text\n")
    assert_equal("<p>just some text</p>", result.content)
  end
  
  def test_paragraph_terminated_by_double_newline
    parser = WebMarkupParser.new
    result = parser.parse("just some text\n\n")
    assert_equal("<p>just some text</p>", result.content)
  end
  
  def test_two_paragraphs_separated_by_double_newline
    parser = WebMarkupParser.new
    result = parser.parse("just some text\n\nand some more")
    assert_equal("<p>just some text</p>\n<p>and some more</p>", result.content)
  end
  
  def test_two_paragraphs_separated_by_triple_newline
    parser = WebMarkupParser.new
    result = parser.parse("just some text\n\n\nand some more")
    assert_equal("<p>just some text</p>\n<p>and some more</p>", result.content)
  end
  
  def test_html_entities_in_paragraph
    parser = WebMarkupParser.new
    result = parser.parse("is a > 0 & a < 10?")
    assert_equal("<p>is a &gt; 0 &amp; a &lt; 10?</p>", result.content)
  end
  
  def test_header_and_paragraph
    parser = WebMarkupParser.new
    result = parser.parse("= haha =\nboo")
    assert_equal("<h1>haha</h1>\n<p>boo</p>", result.content)
  end
  
  def test_paragraph_and_header
    parser = WebMarkupParser.new
    result = parser.parse("boo\n\n= haha =")
    assert_equal("<p>boo</p>\n<h1>haha</h1>", result.content)
  end
  
  def test_paragraph_and_pre
    parser = WebMarkupParser.new
    result = parser.parse("haha\n\n<nomarkupblock>boo</nomarkupblock>")
    assert_equal("<p>haha</p>\nboo", result.content)
  end

  def test_pre_and_paragraph
    parser = WebMarkupParser.new
    result = parser.parse("<nomarkupblock>boo</nomarkupblock>\n\nhaha")
    assert_equal("boo\n<p>haha</p>", result.content)
  end
  
  def test_image
    parser = WebMarkupParser.new
    result = parser.parse("[[Image:foo.png]]")
    assert_equal("<p><img src=\"foo.png\"></p>", result.content)
  end
  
  def test_alternative_image_text
    parser = WebMarkupParser.new
    result = parser.parse("[[Image:foo.png|Some alternative text]]")
    assert_equal("<p><img src=\"foo.png\" alt=\"Some alternative text\"></p>", result.content)
  end
  
  def test_html_entities_in_alternative_image_text
    parser = WebMarkupParser.new
    result = parser.parse("[[Image:foo.png|is a > 0 & a < 10?]]")
    assert_equal("<p><img src=\"foo.png\" alt=\"is a &gt; 0 &amp; a &lt; 10?\"></p>", result.content)
  end
  
  def test_link
    parser = WebMarkupParser.new
    result = parser.parse("[[bar.html]]")
    assert_equal("<p><a href=\"bar.html\">bar.html</a></p>", result.content)
  end
  
  def test_link_with_whitespaces
    parser = WebMarkupParser.new
    result = parser.parse("[[moon bar.html]]")
    #FIXME: should be something like moon%2Cbar.html
    assert_equal("<p><a href=\"moon bar.html\">moon bar.html</a></p>", result.content)
  end
  
  def test_link_title
    parser = WebMarkupParser.new
    result = parser.parse("[[bar.html|Link Title]]")
    assert_equal("<p><a href=\"bar.html\">Link Title</a></p>", result.content)
  end
  
  def test_html_entities_in_link_title
    parser = WebMarkupParser.new
    result = parser.parse("[[bar.html|is a > 0 & a < 10?]]")
    assert_equal("<p><a href=\"bar.html\">is a &gt; 0 &amp; a &lt; 10?</a></p>", result.content)
  end
  
  def test_preformatted_inline
    parser = WebMarkupParser.new
    result = parser.parse("<nomarkup>[[link]] and [[Image:img.jpg]]</nomarkup>")
    assert_equal("<p>[[link]] and [[Image:img.jpg]]</p>", result.content)
  end
  
  def test_preformatted_inline_inbetween
    parser = WebMarkupParser.new
    result = parser.parse("foo<nomarkup>[[link]] and [[Image:img.jpg]]</nomarkup>bar")
    assert_equal("<p>foo[[link]] and [[Image:img.jpg]]bar</p>", result.content)
  end
end
