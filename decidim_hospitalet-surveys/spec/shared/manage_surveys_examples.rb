# -*- coding: utf-8 -*-
# frozen_string_literal: true
RSpec.shared_examples "manage surveys" do
  it "updates a survey" do
    within find("tr", text: survey.scope.name) do
      page.find('.action-icon--edit').click
    end

    within ".edit_survey_result" do
      fill_in :survey_result_other_priorities, with: "Noves prioritats"

      find("*[type=submit]").click
    end

    within ".callout-wrapper" do
      expect(page).to have_content("correctament")
    end
  end

  context "submitting a survey" do
    it "creates a new survey" do
      within ".card-title" do
        page.find('.button--title--new').click
      end

      within ".new_survey_result" do
        select scope.name, from: :survey_result_scope_id
        check translated(category.name, locale: :ca)
        fill_in :survey_result_other_priorities, with: "Altres prioritats"
        fill_in :survey_result_future_ideas, with: "Idees pel futur"
        select "Dona", from: :survey_result_gender
        select "65+", from: :survey_result_age_group
        check "Vius al barri?"
        select "L'Hospitalet de Llobregat", from: :survey_result_city

        find("*[type=submit]").click
      end

      within ".callout-wrapper" do
        expect(page).to have_content("correctament")
      end

      within "table" do
        expect(page).to have_selector(".table-list tbody tr", count: 2)
        expect(page).to have_content user.name
      end
    end

    context "when filling in the user data part" do
      it "inivites the user to the platform" do
        within ".card-title" do
          page.find('.button--title--new').click
        end

        within ".new_survey_result" do
          select scope.name, from: :survey_result_scope_id
          check translated(category.name, locale: :ca)
          fill_in :survey_result_other_priorities, with: "Altres prioritats"
          fill_in :survey_result_future_ideas, with: "Idees pel futur"
          select "Dona", from: :survey_result_gender
          select "65+", from: :survey_result_age_group
          check "Vius al barri?"
          select "L'Hospitalet de Llobregat", from: :survey_result_city
          fill_in :survey_result_email, with: "my_email@example.org"
          fill_in :survey_result_name, with: "Hermenegilda Lozano"

          find("*[type=submit]").click
        end

        within ".callout-wrapper" do
          expect(page).to have_content("convidat")
        end

        within "table" do
          expect(page).to have_selector(".table-list tbody tr", count: 2)
        end
      end
    end
  end

  context "deleting a survey" do
    let!(:survey2) { create(:survey_result, feature: current_feature, selected_categories: [category.id]) }

    before do
      visit current_path
    end

    it "deletes a survey" do
      within find("tr", text: survey2.scope.name) do
        page.find('.action-icon--remove').click
      end

      within ".callout-wrapper" do
        expect(page).to have_content("correctament")
      end

      within "table" do
        expect(page).to_not have_content(survey2.scope.name)
      end
    end
  end

  context "exporting the survey results" do
    let!(:surveys) { create_list(:survey_result, 3, feature: current_feature) }

    it "downloads a csv file with the data" do
      visit current_path

      within ".card-title" do
        page.find('.button--title--export').click
      end

      expect(page.response_headers["Content-Disposition"]).to match(/filename=\"survey_results([^.]*).csv\"/)
    end
  end
end