# frozen_string_literal: true

require "spec_helper"
require_relative "../shared/admin_shared_context"
require_relative "../shared/manage_surveys_examples"

describe "Admin manages surveys", type: :feature do
  include_context "admin"
  it_behaves_like "manage surveys"

  before do
    switch_to_host(organization.host)
    login_as user, scope: :user
    visit decidim_admin.manage_feature_path(participatory_process_id: participatory_process, feature_id: current_feature)
  end
end