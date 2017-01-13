# frozen_string_literal: true
require "spec_helper"

module DecidimHospitalet
  module Surveys
    describe SurveyForm do
      let(:feature) { create(:feature)}
      let(:title) { "Oriol for president!" }
      let(:body) { "Everything would be better" }
      let(:user) { create(:user, organization: feature.organization) }
      let(:category) { create(:category, participatory_process: feature.participatory_process) }
      let(:scope) { create(:scope, organization: feature.organization) }
      let(:category_id) { category.try(:id)}
      let(:scope_id) { scope.try(:id)}
      let(:params) do
        {
          title: title,
          body: body,
          user: user,
          categories_ids: [category_id],
          scope_id: scope_id,
          feature: feature
        }
      end

      subject { described_class.from_params(params) }

      context "when everything is OK" do
        it { is_expected.to be_valid }
      end

      context "when there's no user" do
        let(:user) { nil }
        it { is_expected.to be_invalid }
      end

      context "selected_categories" do
        context "with invalid id" do
          let(:category_id) { 987 }
          it { is_expected.not_to be_valid}
        end

        context "when no category_id" do
          let(:category_id) { nil }
          it { is_expected.not_to be_valid }
        end

        context "when selecting more than 4 valid categories" do
          let!(:categories) do
            create_list(:category, 5, participatory_process: feature.participatory_process)
          end
          let(:category_id) { categories.map(&:id) }
          it { is_expected.not_to be_valid }
        end
      end

      context "when no scope_id" do
        let(:scope_id) { nil }
        it { is_expected.not_to be_valid }
      end

      context "with invalid scope_id" do
        let(:scope_id) { 987 }
        it { is_expected.to be_invalid}
      end

      describe "categories" do
        subject { described_class.from_params(params).categories }

        context "when the category exists" do
          it { is_expected.to all(be_kind_of(Decidim::Category)) }
        end

        context "when the category does not exist" do
          let(:category_id) { 7654 }
          it { is_expected.to eq([]) }
        end

        context "when the category is from another process" do
          let(:category_id) { create(:category).id }
          it { is_expected.to eq([]) }
        end
      end

      describe "scope" do
        subject { described_class.from_params(params).scope }

        context "when the scope exists" do
          it { is_expected.to be_kind_of(Decidim::Scope) }
        end

        context "when the scope does not exist" do
          let(:scope_id) { 3456 }
          it { is_expected.to eq(nil) }
        end

        context "when the scope is from another organization" do
          let(:scope_id) { create(:scope).id }
          it { is_expected.to eq(nil) }
        end
      end

      describe "city" do
        context "when it is set" do
          context "to a blank value" do
            subject { described_class.from_params(params.merge(city: "")) }

            it { is_expected.to be_valid }
          end

          context "with a valid value" do
            subject { described_class.from_params(params.merge(city: "801930008")) }

            it { is_expected.to be_valid }
          end

          context "with an invalid value" do
            subject { described_class.from_params(params.merge(city: "invalid city")) }

            it { is_expected.not_to be_valid }
          end
        end
      end

      describe "gender" do
        context "when it is set" do
          context "to a blank value" do
            subject { described_class.from_params(params.merge(gender: "")) }

            it { is_expected.to be_valid }
          end

          context "with a valid value" do
            subject { described_class.from_params(params.merge(gender: "male")) }

            it { is_expected.to be_valid }
          end

          context "with an invalid value" do
            subject { described_class.from_params(params.merge(gender: "invalid gender")) }

            it { is_expected.not_to be_valid }
          end
        end
      end

      describe "age_group" do
        context "when it is set" do
          context "to a blank value" do
            subject { described_class.from_params(params.merge(age_group: "")) }

            it { is_expected.to be_valid }
          end

          context "with a valid value" do
            subject { described_class.from_params(params.merge(age_group: "65+")) }

            it { is_expected.to be_valid }
          end

          context "with an invalid value" do
            subject { described_class.from_params(params.merge(age_group: "invalid group")) }

            it { is_expected.not_to be_valid }
          end
        end
      end
    end
  end
end