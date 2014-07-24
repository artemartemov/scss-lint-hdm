require 'spec_helper'

describe SCSSLint::Linter::SingleLinePerProperty do
  context 'when properties are each on their own line' do
    let(:css) { <<-CSS }
      p {
        color: #fff;
        margin: 0;
        padding: 5px;
      }
    CSS

    it { should_not report_lint }
  end

  context 'when two properties share a line' do
    let(:css) { <<-CSS }
      p {
        color: #fff;
        margin: 0; padding: 5px;
      }
    CSS

    it { should_not report_lint line: 2 }
    it { should report_lint line: 3, count: 1 }
  end

  context 'when multiple properties share a line' do
    let(:css) { <<-CSS }
      p {
        color: #fff; margin: 0; padding: 5px;
      }
    CSS

    it { should report_lint line: 2, count: 2 }
  end

  context 'when multiple properties share a line on a single line rule set' do
    let(:css) { <<-CSS }
      p { color: #fff; margin: 0; padding: 5px; }
    CSS

    context 'and single line rule sets are allowed' do
      let(:linter_config) { { 'allow_single_line_rule_sets' => true } }

      it { should_not report_lint }
    end

    context 'and single line rule sets are not allowed' do
      let(:linter_config) { { 'allow_single_line_rule_sets' => false } }

      it { should report_lint }
    end
  end

  context 'when a single line rule set contains a single property' do
    let(:css) { <<-CSS }
      p { color: #fff; }
    CSS

    context 'and single line rule sets are allowed' do
      let(:linter_config) { { 'allow_single_line_rule_sets' => true } }

      it { should_not report_lint }
    end

    context 'and single line rule sets are not allowed' do
      let(:linter_config) { { 'allow_single_line_rule_sets' => false } }

      it { should report_lint }
    end
  end
end
