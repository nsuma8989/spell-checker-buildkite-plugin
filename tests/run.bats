#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

@test "Spell check for a file" {
  export BUILDKITE_PLUGIN_SPELL_CHECK_FILES_0="tests/test.md"

  stub docker \
    "run --rm -v $PWD:/workdir tmaier/markdown-spellcheck:latest --report /workdir/tests/test.md : echo spelling errors found in file"

  run "$PWD/hooks/command"

  assert_success
  assert_output --partial "Running spell check on file"
  assert_output --partial "spelling errors found in file"

  unstub docker
 }
