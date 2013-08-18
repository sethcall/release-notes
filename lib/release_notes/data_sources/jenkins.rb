require "rest_client"

module ReleaseNotes
  module DataSources
    class Jenkins

      def fetch_project_data(project_url, build_number='lastSuccessfulBuild')

        response = RestClient.get(build_url(project_url, build_number), { :accept => :json })

        JSON.parse(response.to_str)
      end

      private

      # builds a URL like: https://jenkins-server/jenkins/job/some-project/3899/api/json
      def build_url(project_url, build_number)
        "#{project_url}/#{build_number}/api/json"
      end
    end
  end
end
