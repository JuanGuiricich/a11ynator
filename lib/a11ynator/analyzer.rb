module A11ynator
  class Analyzer
    def initialize(directory)
      @directory = directory
      @rules = [
        Rules::MissingImageAltRule.new
      ]
    end

    def run
      results = {}
      Dir.glob("#{@directory}/**/*.{html,html.erb}").each do |file_path|
        content = File.read(file_path)
        issues = @rules.flat_map { |rule| rule.check(content, file_path) }
        results[file_path] = issues unless issues.empty?
      end
      results
    end
  end
end
