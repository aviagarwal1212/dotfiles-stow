IEx.configure(
  history_size: -1,
  inspect: [
    pretty: true,
    limit: 10_000,
    printable_limit: 10_000,
    binaries: :as_strings,
    charlists: :as_lists
  ]
)
