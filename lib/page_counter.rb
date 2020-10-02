# frozen_string_literal: true

class PageCounter
  def initialize(pages_hash)
    @pages_hash = pages_hash
  end

  def sorted_array(hash_data)
    hash_data.sort_by { |_k, v| v.length }.reverse
  end

  def most_page_views
    # takes default pages_hash
    page_view_calculator('visits')
  end

  def most_unique_page_views
    page_view_calculator('unique views', @pages_hash.transform_values(&:uniq))
  end

  def page_view_calculator(text, options = @pages_hash)
    sorted_array(options).each { |line| print_results(line, text) }
  end

  def print_results(line, text)
    puts "#{line[0]} #{line[1].size} #{text}"
  end
end
