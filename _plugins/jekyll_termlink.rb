
module Jekyll::Termlink
  def termlink(input)

    #{{IEV 102-01-10, IEV:102-01-10}}
    regex = Regexp.new("{{(.+?),\ IEV:([\\d\\-]*?)}}")

    return input if input.scan(regex).size == 0

    input.gsub(regex, '<a href=/concepts/\2>\1</a>')
  end
end

Liquid::Template.register_filter(Jekyll::Termlink)
