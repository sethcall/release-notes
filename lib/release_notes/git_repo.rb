module ReleaseNotes
  class GitRepo

    attr_accessor :url
    def initialize(url)
      @url = url
    end
  end
end