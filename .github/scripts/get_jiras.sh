#!/bin/sh

JIRA_TOKEN="bWF4aW1AYXBwc2ZseWVyLmNvbTp3Nk1OaGJSYUZsZnNhMXBiOEZkdzU3MDU"
BRANCH_NAME="releases/6.x.x/6.6.x/6.6.0-rc2"
fixed_version_found=false
fixed_version=$(echo "$BRANCH_NAME" | grep -Eo '[0-9].[0-9].[0-9]+')
jira_fixed_version="React-Native SDK v$fixed_version"
echo "$jira_fixed_version"
curl -X GET -H "Authorization: Basic $JIRA_TOKEN=" https://appsflyer.atlassian.net/rest/api/3/project/11400/versions | jq -r '.[] | .name+""+.id' | while read version ; do
    if [[ "$version" == *"$jira_fixed_version"* ]];then
        echo "$jira_fixed_version Found!"
        fixed_version_found=true
        version_id=${version#"$jira_fixed_version"}
        echo $(curl -X GET -H "Authorization: Basic $JIRA_TOKEN=" https://appsflyer.atlassian.net/rest/api/3/search?jql=fixVersion=$version_id | jq -r '.issues[] | "- " + .fields["summary"]+"@"') > "$jira_fixed_version-releasenotes".txt
        sed -i -r -e "s/@ /\n/gi" "$jira_fixed_version-releasenotes".txt
        sed -i -r -e "s/@/\n/gi" "$jira_fixed_version-releasenotes".txt
    fi
done
if [ fixed_version_found == false ];then
    echo "${jira_fixed_version} is not found!"
    exit 1
fi
cat "$jira_fixed_version-releasenotes".txt