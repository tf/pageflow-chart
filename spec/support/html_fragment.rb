require 'nokogiri'

class HtmlFragment
  attr_reader :document

  def initialize(html)
    @document = Nokogiri::HTML(html)
  end

  def has_tag?(selector)
    !!document.at_css(selector)
  end

  def has_tags_in_order?(*selectors)
    all_elements = document.css('*')

    elements = selectors.map do |selector|
      document.at_css(selector) ||
        raise("Selector '#{selector}}' did not match any element.")
    end

    elements.each_cons(2).all? do |element1, element2|
      all_elements.index(element1) < all_elements.index(element2)
    end
  end
end
