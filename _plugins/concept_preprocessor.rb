# (c) Copyright 2020 Ribose Inc.
#

require "jekyll/geolexica"

module GeolexicaOverrides
  def read_concept_file(path)
    # binding.pry
    format_termid = lambda do |t|
      t.to_s.rjust(7, "0").insert(3, "-").insert(6, "-")
    end

    concept_hash = super(path)
    concept_hash["termid_sort"] = concept_hash["termid"]
    concept_hash["termid"] = format_termid.(concept_hash["termid"])
    concept_hash["part_number"] = concept_hash["termid"][0..2]
    concept_hash.values.each do |val|
      next unless val.kind_of?(Hash) && val.key?("id")
      val["id"] = concept_hash["termid"]
    end
    concept_hash
  end
end

Jekyll::Geolexica::Glossary.prepend(GeolexicaOverrides)
