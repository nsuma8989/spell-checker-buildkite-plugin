#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

@test "Spell check for a file" {
  export BUILDKITE_PLUGIN_SPELL_CHECK_FILES_0="tests/test.md"

  stub docker \
    "run --rm -v $PWD:/mnt --workdir /mnt starefossen/aspell:latest tests/test.md : echo The following spelling errors have been found in these files: /tests/test.md speelling arre prresent tesst "

  run "$PWD/hooks/command"

  assert_success
  assert_output --partial "Running spell check on 1 file"
  assert_output --partial "The following spelling errors have been found in these files: /tests/test.md speelling arre prresent tesst"

  unstub docker
 }
