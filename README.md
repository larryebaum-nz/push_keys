# push_keys
Simiplify AWS credential updates to TFC/TFE organization workspaces

## Directions
1. If already using [tf-helper](https://github.com/hashicorp-community/tf-helper) the two environment variables `TFH_org` and `TFH_token` will already be configured in your shell-init file. If not, create an API token within TFC/TFE for the organization you wish to manage and set the `TFH_token` variable to this value. Set the `TFH_org` variable to the name of the organization.
2. Add the two additional lines to your shell-init file.
- The first line sets an environment variable to the result returned from an API query to TFC/TFE, asking for a list of workspaces within the specified organization.
- The second line sets an alias command for interactive execution or automation (e.g., cron) to retrieve new AWS credentials and push them to TFE sensitive environment variables within each workspace returned from the prior line.
3. Each execution will collect entirely new credentials and push them to each workspace. Credentials are valid for the duration set in the company policy.

### To Do:
1. Rethink logic. This creates TFE AWS Env Varialbles in each workspace, regardless of whether they are needed or not. Kinda overkill, but I don't think it'll hurt anything. Is there something we can key off of during the API query?
---
Tested against [Oh My Zsh](ohmyz.sh) on OSX 10.15.6 and Terraform Cloud
