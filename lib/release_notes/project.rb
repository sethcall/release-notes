module ReleaseNotes
  class Project

    attr_accessor :sub_projects
    attr_accessor :jenkins_projects
    attr_accessor :git_repos
    attr_accessor :jira_projects

    attr_accessor :name

    def initialize(name)
      @name = name
      @sub_projects = {}
      @jenkins_projects = {}
      @git_repos = []
      @jira_projects = {}
    end

    def add_sub_project(name)
      sub_project = SubProject.new(name)
      sub_projects[name] = sub_project
    end

    def add_jenkins_project(name, jenkins_url, jenkins_data)
      jenkins_project = JenkinsProject.new(name, jenkins_url, jenkins_data)
      jenkins_projects[name] = jenkins_project
    end

    def add_git_repo(url, data)
      git_repos[url] = GitRepo.new(url)
    end

    def add_jira_project(name, jira_data)
      jira_project = JiraProject.new(name, jira_data["url"])
      jira_projects[name] = jira_project
    end
  end
end