module Tmdb
  class Company < Resource
    has_resource 'company', :plural => 'companies'

    #http://docs.themoviedb.apiary.io/#companies
    @@fields = [
      :description,
      :headquarters,
      :homepage,
      :id,
      :logo_path,
      :name,
      :parent_company
    ]

    @@fields.each do |field|
      attr_accessor field
    end

    #Get the list of movies associated with a particular company.
    def self.movies(id, conditions={})
      search = Tmdb::Search.new("/#{self.endpoints[:singular]}/#{self.endpoint_id + id.to_s}/movies")
      search.fetch
    end

  end
end