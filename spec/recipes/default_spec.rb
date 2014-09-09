require 'spec_helper'

describe 'foobar::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs telnet' do
    expect(chef_run).to install_package('telnet')
  end

  it 'creates the foobar home directory' do
    expect(chef_run).to create_directory('/opt/foobar')
  end

  it 'creates the foobar default configuration file' do
    expect(chef_run).to create_template('/etc/default/foobar')
  end

end
