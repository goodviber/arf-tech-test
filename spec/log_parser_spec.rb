# frozen_string_literal: true

require 'spec_helper'

RSpec.describe LogParser do
  let(:log_path) { 'spec/fixtures/webserver_test.log' }
  subject { described_class.new(log_path) }

  describe '#group_log_file' do
    it 'converts the log to a hash' do
      expect(subject.group_log_file).to eq({'/home' => [['225.183.113.22'], ['225.183.113.22']], '/contact/' => [['245.141.61.189'], ['61.64.28.106']], '/index' => [['122.255.244.161']], '/about' => [['138.222.28.220'], ['228.32.104.207']], '/products/3' => [['138.222.28.220']]})
    end
  end

end
