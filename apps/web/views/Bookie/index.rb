# frozen_string_literal: true

module Web::Views::Bookie
  class Index
    include Web::View

    def image_for_country_code(country_code)
      image("#{country_code.downcase}.svg")
    end
  end
end
