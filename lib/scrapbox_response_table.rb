require "scrapbox_response_table/version"
require "scrapbox_table_fetcher"

module ScrapboxResponseTable
  class ResponseFetcher
    def initialize(project, page, table)
      @project = project
      @page = page
      @table = table
      @fetcher = ScrapboxTableFetcher::Fetcher.new(project)
    end

    def response(key)
      @target ||= @fetcher.fetch(@page).select {|table| table.name == @table}[0]
      @target.search_row('key', key)[0]['url']
    end
  end
end
