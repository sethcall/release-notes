module ReleaseNotes
  class Populater

    def initialize()

    end

    def populate(config_file, build_ranges)
      data_store = DataStore.new(config_file)

      build_ranges.each do |project_name, build_range |
        project = data_store.projects[project_name]

        raise "There is no project known by the name #{project_name}" if project.nil?

        if build_range.start_build_no != build_range.end_build_no
          jenkins_project = project.jenkins_projects[build_range.jenkins_project]

          raise "There is no jenkins project known by the name #{build_range.jenkins_project}" if jenkins_project.nil?

          jenkins_project.fetch_start(build_number)
        end
      end
    end
  end
end
