  module ReleaseNotes
  class JiraProject

    attr_accessor :name, :url

    def initialize(name, url)
      @name = name
      @url = url
    end
  end
end