# (c) Copyright 2020 Ribose Inc.
#

require "jekyll/geolexica/concepts_generator"

module GeolexicaOverrides
  def read_concept_file(path)
    # binding.pry
    format_termid = lambda do |t|
      t.to_s.rjust(7, "0").insert(3, "-").insert(6, "-")
    end

    concept_hash = super(path)
    concept_hash["termid_human"] = format_termid.(concept_hash["termid"])
    concept_hash.values.each do |val|
      next unless val.kind_of?(Hash) && val.key?("id")
      val["id"] = format_termid.(val["termid"])
    end
    concept_hash
  end
end

Jekyll::Geolexica::ConceptsGenerator.prepend(GeolexicaOverrides)