module ReleaseNotes
  class DataStore

    attr_accessor :projects

    def initialize(config_file)
      @projects = {}

      configuration = JSON.parse( IO.read(config_file) )

      # jenkins root URL
      @jenkins_root = configuration["jenkins_root"]

      # project == hash
      projects = configuration["projects"]

      projects.each do |project_name, project_data|
        jenkins_projects = project_data["jenkins"]
        git_repos = project_data["git"]
        jira_projects = project_data["jira"]

        project = Project.new(project_name)

        jenkins_projects.each do |jenkins_name, jenkins_data|
          project.add_jenkins_project(jenkins_name, build_project_url(jenkins_name), jenkins_data)
        end unless jenkins_project.nil?

        git_repos.each do |git_url, git_data|
          project.add_git_repo(git_url, git_data)
        end unless git_repos.nil?

        jira_projects.each do |jira_project_name, jira_project_data|
          project.add_jira_project(jira_project_name, jira_project_data)
        end unless jira_projects.nil?

        projects[project_name] = project
      end
    end

    private

    def build_project_url(project_name)
      "#{@jenkins_root}/job/#{project_name}"
    end
  end
end