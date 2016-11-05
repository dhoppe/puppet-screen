require 'spec_helper'

describe 'screen::define', type: :define do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      let(:pre_condition) { 'include screen' }
      let(:title) { 'screenrc' }

      context 'when source file' do
        let(:params) do
          {
            config_file_path: '/etc/screenrc.2nd',
            config_file_source: 'puppet:///modules/screen/common/etc/screenrc'
          }
        end

        it do
          is_expected.to contain_file('define_screenrc').with(
            'ensure'  => 'present',
            'source'  => 'puppet:///modules/screen/common/etc/screenrc',
            'require' => 'Package[screen]'
          )
        end
      end

      context 'when content string' do
        let(:params) do
          {
            config_file_path: '/etc/screenrc.3rd',
            config_file_string: '# THIS FILE IS MANAGED BY PUPPET'
          }
        end

        it do
          is_expected.to contain_file('define_screenrc').with(
            'ensure'  => 'present',
            'content' => %r{THIS FILE IS MANAGED BY PUPPET},
            'require' => 'Package[screen]'
          )
        end
      end

      # context 'when content template' do
      #   let(:params) {{
      #     :config_file_path     => '/etc/screenrc.4th',
      #     :config_file_template => 'screen/common/etc/screenrc.erb',
      #   }}

      #   it do
      #     is_expected.to contain_file('define_screenrc').with(
      #       'ensure'  => 'present',
      #       'content' => /THIS FILE IS MANAGED BY PUPPET/,
      #       'require' => 'Package[screen]',
      #     )
      #   end
      # end

      # context 'when content template (custom)' do
      #   let(:params) {{
      #     :config_file_path         => '/etc/screenrc.5th',
      #     :config_file_template     => 'screen/common/etc/screenrc.erb',
      #     :config_file_options_hash => {
      #       'key' => 'value',
      #     },
      #   }}

      #   it do
      #     is_expected.to contain_file('define_screenrc').with(
      #       'ensure'  => 'present',
      #       'content' => /THIS FILE IS MANAGED BY PUPPET/,
      #       'require' => 'Package[screen]',
      #     )
      #   end
      # end
    end
  end
end
