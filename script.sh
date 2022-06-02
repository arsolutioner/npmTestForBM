plugin_version=$(echo 'releases/6.x.x/6.6.x/6.6.1-rc1' | grep -Eo '[0-9].[0-9].[0-9]+-rc[0-9]+')
echo $plugin_version
npm version $plugin_version