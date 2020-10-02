# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PageCounter do
  let(:pages_hash) {
    { '/home' => [['225.183.113.22'], ['225.183.113.22']],
      '/contact/' => [['245.141.61.189'], ['61.64.28.106']],
      '/index' => [['122.255.244.161']],
      '/about' => [['138.222.28.220'], ['228.32.104.207']],
      '/products/3' => [['138.222.28.220']]
    }
  }
  subject { described_class.new(pages_hash) }

  describe '#sorted_array' do
    it 'returns an array sorted by number of views' do
      expect(subject.sorted_array(pages_hash)).to eq(
        [
          ["/about", [["138.222.28.220"], ["228.32.104.207"]]],
          ["/contact/", [["245.141.61.189"], ['61.64.28.106']]],
          ['/home', [['225.183.113.22'], ['225.183.113.22']]],
          ["/products/3", [["138.222.28.220"]]],
          ["/index", [["122.255.244.161"]]]
        ]
      )
    end
  end

  describe '#print_results' do
    it 'outputs a result from an array and text argument' do
      expect { subject.print_results(["/about", [["138.222.28.220"], ["228.32.104.207"]]], "some text") }
      .to output("/about 2 some text\n").to_stdout
    end
  end

  describe '#page_view_calculator' do
    context 'with default pages_hash argument' do
      it 'outputs sorted results from @pages_hash and text argument' do
        expect { subject.page_view_calculator("suffix") }
        .to output(
          "/about 2 suffix\n/contact/ 2 suffix\n/home 2 suffix\n/products/3 1 suffix\n/index 1 suffix\n"
        ).to_stdout
      end
    end

    context 'with specified pages_hash argument' do
      it 'outputs sorted results from a pages_hash and text argument' do
      unique_pages_hash = pages_hash.transform_values(&:uniq)
      expect { subject.page_view_calculator("suffix", unique_pages_hash) }
        .to output(
          "/about 2 suffix\n/contact/ 2 suffix\n/products/3 1 suffix\n/index 1 suffix\n/home 1 suffix\n"
        ).to_stdout
      end
    end
  end

  describe '#most_page_views' do
    it 'prints the webpages with most page views in descending order' do
      expect { subject.most_page_views }.to output(
       "/about 2 visits\n/contact/ 2 visits\n/home 2 visits\n/products/3 1 visits\n/index 1 visits\n"
      ).to_stdout
    end
  end

  describe '#most_unique_page_views' do
    it 'prints the webpages with most unique page views in descending order' do
      expect { subject.most_unique_page_views }.to output(
        "/about 2 unique views\n/contact/ 2 unique views\n/products/3 1 unique views\n/index 1 unique views\n/home 1 unique views\n"
      ).to_stdout
    end
  end
end
