#prospects
context "when the scenario is restricted  by divisions and initiatives" do
    let!(:division_1) { create(:division, organization: organization, app_import: app_import) }
    let!(:divisions_household_1) { create(:divisions_household, division: division_1, household: top_future_prospect) }
    let!(:divisions_household_2) { create(:divisions_household, household: top_identified_prospect) }
    let!(:divisions_scenario) { create(:divisions_scenario, division: division_1, scenario: scenario) }
    let(:initiative) { create(:initiative, organization: organization) }
    let!(:scenario_initiative) do
      create(:scenario_initiative,
             scenario: scenario,
             initiative: initiative,
             goal_amount: scenario.goal_amount)
    end
    let!(:gift_1) do
      create(:gift, :with_fund,
             household: top_identified_prospect,
             organization: organization,
             app_import: app_import,
             received_on: scenario.started_on + 1.day,
             constituent: top_identified_prospect.constituents.first,
             gift_amount: scenario.major_gift_threshold_amount + 10)
    end

    before do
      scenario.reload.update!(scenario_type: "restricted_initiative_division")
    end

    it "filtered household should Include divsion household only tied to the scenario" do
      expect(filtered).to contain_exactly(top_future_prospect)
    end

    it "filtered household should not Include divsion households not tied to the scenario" do
      expect(filtered).not_to contain_exactly(top_identified_prospect)
    end

  end


#Proposals
context "when scenario is restricted by divisions and initiatives" do
    let!(:division) { create(:division) }
    let!(:division2) { create(:division) }
    let!(:division_household) do
      create(:divisions_household,
             division: division,
             household: top_level_proposal.constituent.household)
    end
    let!(:division_household2) do
      create(:divisions_household,
             household: bottom_level_proposal.constituent.household)
    end
    let!(:division_scenario) do
      create(:divisions_scenario,
             division: division,
             scenario: scenario)
    end
    let(:initiative) { create(:initiative, organization: organization) }
    let!(:scenario_initiative) do
      create(:scenario_initiative,
             scenario: scenario,
             initiative: initiative,
             goal_amount: scenario.goal_amount)
    end
    let(:app_import) { create(:app_import, :completed, organization: organization) }
    let!(:bottom_fund) { create(:fund, app_import: app_import, organization: organization) }
    let!(:top_fund) { create(:fund, app_import: app_import, organization: organization) }

    before do
      scenario.reload.update!(scenario_type: "restricted_initiative_division")
      top_level_proposal.update!(fund: top_fund)
    end

    it "does not have propsals in the non restricted initiative divisions" do
      expect(filtered).not_to contain_exactly bottom_level_proposal
    end

    context "with matching initiative fund" do
      let!(:fund_initiative) do
        create(:fund_initiative,
               organization: organization,
               initiative: initiative,
               external_id: top_fund.external_id)
      end

      it "filters proposals with initiative and division" do
        expect(filtered).to eq([top_level_proposal])
      end
    end

  end

#Donors
context "when scenario is restricted by divisions and initiatives" do
    let!(:organization_initiative) { create(:initiative, organization: organization) }
    let(:initiative) { create(:initiative, organization: organization) }
    let!(:scenario_initiative) do
      create(:scenario_initiative,
             scenario: scenario,
             initiative: initiative,
             goal_amount: scenario.goal_amount)
    end
    let!(:division_1) { create(:division, organization: organization, app_import: app_import) }
    let!(:divisions_household_1) do
      create(:divisions_household,
             division: division_1,
             household: household_1)
    end
    let!(:divisions_scenario) { create(:divisions_scenario, division: division_1, scenario: scenario) }
    let!(:fund_initiative) do
      create(:fund_initiative,
             organization: organization,
             initiative: initiative,
             external_id: gift_1.fund.external_id)
    end

    before do
      scenario.reload.update!(scenario_type: "restricted_initiative_division")
    end

    it "only has a household associated with both  division and initiative" do
      expect(filtered).to contain_exactly household_1
    end

    it "does not have have household not associated with both division and initiative" do
      expect(filtered).not_to contain_exactly household_2
    end
  end