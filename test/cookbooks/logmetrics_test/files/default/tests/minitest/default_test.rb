
describe 'logmetrics::default' do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  it 'installs logmetrics' do
    assert_file "/usr/bin/logmetrics", "root", "root", "755"
  end
end
