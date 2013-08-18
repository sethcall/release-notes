require 'spec_helper'

describe Jenkins, :integration => true do


  let(:data_store) { DataStore.new(ENV['RELEASE_NOTES_CONFIG'])}

  describe "fetch_project_data" do

    it "should succeed" do

    end
  end
end