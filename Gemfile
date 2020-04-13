source "https://rubygems.org"

gem "jekyll", "~> 4.0"

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.6"
  gem "jekyll-geolexica", github: "strogonoff/geolexica-server", ref: '3ff15e3'
  gem "jekyll-theme-isotc211-helpers", "~> 0.6.0"
  gem "jekyll-plugin-frontend-build", "~> 0.0.3"
  gem "jekyll-data"
  gem "jekyll-asciimath", git: "https://github.com/riboseinc/jekyll-asciimath", ref: '9d2797e'
  gem "jekyll-sitemap"
  gem "jekyll-asciidoc"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.0" if Gem.win_platform?
