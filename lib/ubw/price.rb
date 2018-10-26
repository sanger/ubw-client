module Ubw
  class Price < Resource
    include Ubw::Queries::Where
    include Ubw::Queries::All
    @endpoint = '/prices'
  end
end