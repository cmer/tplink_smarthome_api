require 'shell_mock'

RSpec.describe TplinkSmarthomeApi do
  it "has a version number" do
    expect(TplinkSmarthomeApi::VERSION).not_to be nil
  end

  context "dependencies_met?" do
    before { ShellMock.enable }
    after  { ShellMock.disable }

    let(:shell_command) { 'which tplink-smarthome-api' }
    let(:stub_success)  { ShellMock.stub_command(shell_command).to_succeed }
    let(:stub_fail)     { ShellMock.stub_command(shell_command).to_fail }

    it 'is true when dependencies are met' do
      stub_success
      expect(TplinkSmarthomeApi.dependencies_met?).to be true
      expect(stub_success).to have_run
    end

    it 'is false when dependencies are not met' do
      stub_fail
      expect(TplinkSmarthomeApi.dependencies_met?).to be false
      expect(stub_fail).to have_run
    end
  end
end
