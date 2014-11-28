require 'spec_helper'

describe 'screen::define', :type => :define do
  ['Debian'].each do |osfamily|
    let(:facts) {{
      :osfamily => osfamily,
    }}
    let(:pre_condition) { 'include screen' }
    let(:title) { 'screenrc' }

    context "on #{osfamily}" do
      context 'when source file' do
        let(:params) {{
          :config_file_source => 'puppet:///modules/screen/common/etc/screenrc',
        }}

        it do
          is_expected.to contain_file('define_screenrc').with({
            'ensure'  => 'present',
            'source'  => 'puppet:///modules/screen/common/etc/screenrc',
            'require' => 'Package[screen]',
          })
        end
      end

      context 'when content string' do
        let(:params) {{
          :config_file_string => '# THIS FILE IS MANAGED BY PUPPET',
        }}

        it do
          is_expected.to contain_file('define_screenrc').with({
            'ensure'  => 'present',
            'content' => /THIS FILE IS MANAGED BY PUPPET/,
            'require' => 'Package[screen]',
          })
        end
      end

#      context 'when content template' do
#        let(:params) {{
#          :config_file_template => 'screen/common/etc/screenrc.erb',
#        }}
#
#        it do
#          is_expected.to contain_file('define_screenrc').with({
#            'ensure'  => 'present',
#            'content' => /THIS FILE IS MANAGED BY PUPPET/,
#            'require' => 'Package[screen]',
#          })
#        end
#      end
#
#      context 'when content template (custom)' do
#        let(:params) {{
#          :config_file_template     => 'screen/common/etc/screenrc.erb',
#          :config_file_options_hash => {
#            'key' => 'value',
#          },
#        }}
#
#        it do
#          is_expected.to contain_file('define_screenrc').with({
#            'ensure'  => 'present',
#            'content' => /THIS FILE IS MANAGED BY PUPPET/,
#            'require' => 'Package[screen]',
#          })
#        end
#      end
    end
  end
end
