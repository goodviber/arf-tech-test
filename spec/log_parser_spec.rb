require 'spec_helper'

RSpec.describe LogParser do
  let(:log_path) { 'spec/fixtures/webserver_test.log' }
  subject { described_class.new(log_path) }

  it 'outputs each line' do
    expect { subject.parse_log_file }.to output('hello').to_stdout
  end
end