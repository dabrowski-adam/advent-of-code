#!/bin/bash

# This script will be run bazel when building process starts to
# generate key-value information that represents the status of the
# workspace. The output should be like
#
# KEY1 VALUE1
# KEY2 VALUE2
#
# If the script exits with non-zero code, it's considered as a failure
# and the output will be discarded.

set -eo pipefail # exit immediately if any command fails.

function remove_url_credentials() {
  which perl >/dev/null && perl -pe 's#//.*?:.*?@#//#' || cat
}

repo_url=$(git config --get remote.origin.url | remove_url_credentials)
echo "REPO_URL $repo_url"

commit_sha=$(git rev-parse HEAD)
echo "COMMIT_SHA $commit_sha"

git_branch=$(git rev-parse --abbrev-ref HEAD)
echo "GIT_BRANCH $git_branch"

git_tree_status=$(git diff-index --quiet HEAD -- && echo 'Clean' || echo 'Modified')
echo "GIT_TREE_STATUS $git_tree_status"

# Note: the "STABLE_" suffix causes these to be part of the "stable" workspace
# status, which may trigger rebuilds of certain targets if these values change
# and you're building with the "--stamp" flag.
#latest_version_tag=$(./tools/latest_version_tag.sh)
#echo "STABLE_VERSION_TAG $latest_version_tag"
#echo "STABLE_COMMIT_SHA $commit_sha"
