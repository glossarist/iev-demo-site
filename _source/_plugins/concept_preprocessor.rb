# (c) Copyright 2020 Ribose Inc.
#

require "jekyll/geolexica"

module GeolexicaOverrides
  def read_concept_file(path)
    concept_hash = super(path)
    concept_hash["termid_sort"] = concept_hash["termid"]
    concept_hash["part_number"] = concept_hash["termid"][0..2]

    # traverse localized
    concept_hash.each_value do |localized|
      next unless localized.kind_of?(Hash)

      if localized.key?("authoritative_source")
        localized["authoritative_source"] =
          [localized["authoritative_source"]].flatten.compact.first
      end
    end

    concept_hash
  end
end

Jekyll::Geolexica::Glossary.prepend(GeolexicaOverrides)
