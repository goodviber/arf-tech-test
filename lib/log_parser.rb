class LogParser
  def initialize(log_path)
    @log_path = log_path
  end

  def parse_log_file
    File.open(@log_path).each do |line|
      puts line
    end
  end
end