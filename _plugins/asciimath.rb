require "asciimath"

$ASCIIMATH_STYLE = File.join(Gem::Specification.find_by_name("asciimath").gem_dir, "style", "math.css")

$ASCIIMATH_DELIMITER_REGEX = /(?<=\$\$)[^\$\$]+(?=\$\$)/
# This one has to stay in sync with software that writes concept data
# (GUI app / legacy migration script)

Jekyll::Hooks.register :site, :post_write do |site|
  system("cp #{$ASCIIMATH_STYLE} #{site.config['destination'] || '_site'}/assets/math.css")
end


module Jekyll::AsciiMathFilter
  def asciimath(input)

    if input.scan($ASCIIMATH_DELIMITER_REGEX).size > 0
      pieces = "$$ #{input} $$".scan($ASCIIMATH_DELIMITER_REGEX)
      parsed_pieces = []
      pieces.each_with_index { |piece, idx|
        if idx.odd?
          parsed_pieces << AsciiMath.parse(piece).to_html
        elsif piece != ' '
          parsed_pieces << piece
        end
      }
      return parsed_pieces.join('')
    else
      return input
    end
  end
end

Liquid::Template.register_filter(Jekyll::AsciiMathFilter)