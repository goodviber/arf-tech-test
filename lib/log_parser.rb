# frozen_string_literal: true

class LogParser
  def initialize(log_path)
    @log_path = log_path
  end

  def group_log_file
    log_array = File.open(@log_path).map { |line| line.split(/\s+/) }
    log_array.group_by(&:shift)
  end
end
