require 'spec_helper'

describe SCSSLint::Linter::HexLinter do
  let(:engine) { SCSSLint::Engine.new(css) }

  before do
    subject.run(engine)
  end

  context 'when rule is empty' do
    let(:css) { <<-CSS }
      p {
      }
    CSS

    it { should_not report_lint }
  end

  context 'when rule contains properties with valid hex codes' do
    let(:css) { <<-CSS }
      p {
        background: #ccc;
        color: #1234ab;
      }
    CSS

    it { should_not report_lint }
  end

  context 'when a property has a hex code with uppercase characters' do
    let(:css) { <<-CSS }
      p {
        color: #DDD;
      }
    CSS

    it { should report_lint line: 2 }
  end

  context 'when a property has a hex code that can be condensed to 3 digits' do
    let(:css) { <<-CSS }
      p {
        color: #11bb44;
      }
    CSS

    it { should report_lint line: 2 }
  end

  context 'when rule contains multiple properties with invalid hex codes' do
    let(:css) { <<-CSS }
      p {
        background: #000000;
        color: #DDD;
      }
    CSS

    it { should report_lint line: 2 }
    it { should report_lint line: 3 }
  end
end
