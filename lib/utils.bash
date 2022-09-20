#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/bytecodealliance/wasmtime"
TOOL_NAME="wasmtime"
TOOL_TEST="wasmtime --version"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
  if [ -n "$GITHUB_API_TOKEN" ]; then
    arg="-H 'Authorization: token $GITHUB_API_TOKEN'"
  fi
  curl $arg --silent "https://api.github.com/repos/bytecodealliance/wasmtime/releases" |
    grep tag_name |
    cut -d '"' -f 4
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="${3%/bin}"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    mkdir -p "$install_path"
    full_path=$(realpath $0)
    dir_path=$(dirname $full_path)
    $dir_path/wasmtime-install --version "$version" --install-dir "$install_path"

    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error occurred while installing $TOOL_NAME $version."
  )
}
