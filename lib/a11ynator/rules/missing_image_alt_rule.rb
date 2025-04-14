module A11ynator
  module Rules
    class MissingImageAltRule < BaseRule
      def check(content, file)
        check_img_tags(content, file) + check_image_tag_helpers(content, file)
      end

      private

      def check_img_tags(content, file)
        doc = Nokogiri::HTML(content)
        doc.css('img').each_with_index.map do |img, index|
          next if img.attribute('alt') && !img.attribute('alt').value.strip.empty?

          {
            index: index,
            file: file,
            line: img.line,
            tag: img.to_s,
            type: :missing_img_alt
          }
        end.compact
      end

      def check_image_tag_helpers(content, file)
        issues = []
        content.lines.each_with_index do |line, idx|
          if line =~ /<%=\s*image_tag\s+.*?['"][^'"]+['"].*?%>/ &&
             (
               !(line.include?("alt:")) ||
               line =~ /alt:\s*(['"])\s*\1/ ||
               line =~ /alt:\s*nil/
             )
            issues << {
              index: idx,
              file: file,
              line: idx + 1,
              tag: line.strip,
              type: :missing_image_tag_alt
            }
          end
        end
        issues
      end
    end
  end
end
