class RepositoryInformation < Base
  
  def initialize page = 1
    @options = { per_page: 50, query: { page: 1, per_page: 50} }
  end

 
end