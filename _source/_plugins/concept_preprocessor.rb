# (c) Copyright 2020 Ribose Inc.
#

require "jekyll/geolexica"

module GeolexicaOverrides
  def read_concept_file(path)
    concept_hash = super(path)
    concept_hash["termid_sort"] = concept_hash["termid"]
    concept_hash["part_number"] = concept_hash["termid"][0..2]
    concept_hash
  end
end

Jekyll::Geolexica::Glossary.prepend(GeolexicaOverrides)
