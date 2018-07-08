require "scrapbox_response_table/version"
require "scrapbox_table_fetcher"

module ScrapboxResponseTable
  class ResponseFetcher
    def initialize(project, page, table, key_column, response_column)
      @project = project
      @page = page
      @table = table
      @key_column = key_column
      @response_column = response_column
      @fetcher = ScrapboxTableFetcher::Fetcher.new(project)
    end

    def response(key)
      @target ||= @fetcher.fetch(@page).select {|table| table.name == @table}[0]
      @target.search_row(@key_column, key)[0][@response_column]
    end
  end
end
