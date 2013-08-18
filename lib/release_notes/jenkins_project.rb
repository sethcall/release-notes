module ReleaseNotes
  class JenkinsProject

    attr_accessor :name, :url, :start_git_sha1, :end_git_sha1, :git_repos

    def initialize(name, project_url, jenkins_data)
      @name = name
      @url = project_url
      @jenkins_data_source = Jenkins.new()
    end

    def fetch(start_build_no, end_build_no)
      start_data = @jenkins_data_source.fetch_project_data(@url, start_build_no)
      end_data = @jenkins_data_source.fetch_project_data(@url, end_build_no)

      start_revision = start_data["actions"]["lastBuiltRevision"]
      end_revision = end_data["actions"]["lastBuiltRevision"]

      @start_git_sha1 = start_revision["SHA1"]
      @end_git_sha1 = end_revision["SHA1"]

      @git_repos = start_data["actions"]["remoteUrls"]
    end
  end
end