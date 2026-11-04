#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
patch_root="${repo_root}/kernel-patches"

cd "${repo_root}"

while IFS= read -r patch; do
  rel_path="${patch#"${patch_root}/"}"
  repo_dir="$(dirname "${rel_path}")"

  if [ ! -d "${repo_dir}/.git" ] && [ ! -L "${repo_dir}/.git" ]; then
    echo "Patch target is not a git checkout: ${repo_dir}" >&2
    exit 1
  fi

  git -C "${repo_dir}" am --3way "${patch}"
done < <(find "${patch_root}" -mindepth 2 -type f -name '*.patch' | sort)
