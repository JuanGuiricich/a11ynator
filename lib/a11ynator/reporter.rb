module A11ynator
  class Reporter
    def initialize(results)
      @results = results
    end

    def print_summary
      if @results.empty?
        puts 'All HTML files have proper alt attributes!'
      else
        @results.each do |file, issues|
          puts "File: #{file}"
          issues.each { |i| puts "  Line #{i[:line]}: #{i[:tag]}" }
          puts
        end
      end
    end
  end
end
