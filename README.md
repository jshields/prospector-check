# prospector-check
GitHub Action for [prospector](https://prospector.readthedocs.io/en/master/)

Make sure you have a `.prospector.yaml` file at the root of your repository!

This fork runs Prospector on the files that have been modified in a branch.

WARN: It is currently hardcoded to assume `dev` as the base branch.

A future improvement might be to use a separate action to gather the files,
and accept those files as input in this action.

## Inputs

None

## Outputs

None

## Example usage

```yaml
# .github/workflows/prospector.yml
name: Prospector

on: [push]

jobs:
  prospector:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
      with:
        # need full commit history so merge-base will find the base / ancestor (should be i.e. "dev" branch)
        fetch-depth: 0
    # make the name "origin/dev" available to the merge-base command
    - run: git fetch origin dev
    - uses: jshields/prospector-check@master

```
