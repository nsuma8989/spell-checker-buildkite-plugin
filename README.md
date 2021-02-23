# spell-checker-buildkite-plugin
Buildkite Plugin to check spelling

## Example

This will check all shellscripts with shellcheck.

```yml
steps:
  - plugins:
      - nsuma8989/spell-check#v1.0.2:
          files: *.md
```
