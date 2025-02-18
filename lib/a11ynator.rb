require 'nokogiri'

# A tool to check accessibility of web pages.
class A11ynator
  def self.check_img_alt(html_content, file: 'unknown')
    doc = Nokogiri::HTML(html_content)
    missing_alt_attributes(doc, file)
  end

  def self.missing_alt_attributes(doc, file)
    doc.css('img').each_with_index.each_with_object([]) do |(img, index), missing_alts|
      next if img.attribute('alt')

      missing_alts << {
        index: index,
        file: file,
        line: img.line,
        tag: img.to_s
      }
    end
  end

  def self.check_directory(directory)
    results = {}
    Dir.glob("#{directory}/**/*.html").each do |file_path|
      html_content = File.read(file_path)
      missing = check_img_alt(html_content, file: file_path)
      results[file_path] = missing unless missing.empty?
    end
    results
  end
end

if __FILE__ == $0
  results = A11ynator.check_directory('.')

  if results.empty?
    puts "All HTML files have proper alt attributes on <img> tags!"
  else
    results.each do |file, issues|
      puts "File: #{file}"
      issues.each do |issue|
        puts "  Line #{issue[:line]}: #{issue[:tag]}"
      end
      puts "\n"
    end
  end
end
