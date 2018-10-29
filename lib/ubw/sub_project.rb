module Ubw
  class SubProject < Resource
    include Ubw::Queries::Find
    include Ubw::Queries::Where
    include Ubw::Queries::All
    @endpoint = '/subprojects'
  end
end
