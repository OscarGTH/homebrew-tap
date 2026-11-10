# OscarGTH's Homebrew tap

Formulae for my own tools. macOS and Linuxbrew both work.

## Install

```sh
brew install OscarGTH/tap/readcode
```

or, if you prefer the two-step form:

```sh
brew tap OscarGTH/tap
brew install readcode
```

## What is in here

| Formula | What it does |
|---|---|
| `readcode` | Learn a programming language by annotating real code, then get graded on it — [github.com/OscarGTH/readcode](https://github.com/OscarGTH/readcode) |

## Notes on `readcode`

- The formula builds from source, so Homebrew pulls `rust` in as a build-only
  dependency. Expect about a minute on a recent machine; the toolchain is not
  kept afterwards.
- `brew upgrade readcode` picks up new tags once this formula is bumped.
- The snippets ship inside the binary, so the command works offline with no data
  files to install. Progress lives in `~/.local/share/readcode/` (or
  `$XDG_DATA_HOME/readcode`).
- To use a model or your own agent for grading, see
  [Choosing a reviewer](https://github.com/OscarGTH/readcode#choosing-a-reviewer).
- Want the bleeding edge instead of a release? `brew install --HEAD readcode`.

## Maintaining a formula here

1. Tag a release in the upstream repo.
2. Update `url` (new tag) and `sha256` in `Formula/<name>.rb`:

   ```sh
   curl -sSL -o /tmp/src.tar.gz https://github.com/OscarGTH/readcode/archive/refs/tags/vX.Y.Z.tar.gz
   shasum -a 256 /tmp/src.tar.gz
   ```

3. `brew audit --strict --new OscarGTH/tap/<name>`, then
   `brew install --build-from-source OscarGTH/tap/<name>` and `brew test <name>`.
