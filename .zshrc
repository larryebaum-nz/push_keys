export TFH_org=<TARGET_ORGANIZATION_NAME> #common variable used with tf-helper https://github.com/hashicorp-community/tf-helper
export TFH_token=<TARGET_ORGANIZATION TOKEN> #common variable used with tf-helper https://github.com/hashicorp-community/tf-helper

# Query TFE organization for list of workspaces
export tfeworkspacenames=$(curl --header "Authorization: Bearer $TFH_token" --header "Content-Type: application/vnd.api+json" https://app.terraform.io/api/v2/organizations/$TFH_org/workspaces -s | jq -c '.data[].attributes.name' | awk -F\" '{print $2}' )
# Refresh connection, retrieve temporary AWS credentials and push to workspace; results in unique credentials per workspace
alias TFEpushAWSkeys='f(){echo $1; doormat aws --account se_demos_dev --tf-push --tf-organization $TFH_org --tf-workspace $1};doormat -r && eval $(doormat aws -a se_demos_dev); echo $tfeworkspacenames | while IFS= read -r ws; do f $ws; done'
