# Expect:
#   jq -f sync-keys.jq source.json target.json

.[0] as $src
| .[1] as $tgt
| $src
| with_entries(
    .value = ($tgt[.key] // .value)
  )