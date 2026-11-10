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

> **Homebrew 6 and later:** a third-party tap can contain arbitrary Ruby, so
> Homebrew now asks you to trust one before it loads its formulae. If a command
> refuses with "untrusted tap", run `brew trust OscarGTH/tap` once and retry.

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

3. Trust the tap, then audit and install from source:

   ```sh
   brew trust --formula OscarGTH/tap/<name>     # Homebrew 6+; without it audit refuses
   brew audit --strict --new OscarGTH/tap/<name>
   brew install --build-from-source OscarGTH/tap/<name>
   brew test <name>
   ```

   On Homebrew 6 an audit of this tap fails with "Refusing to load formula …
   from untrusted tap" until it is trusted. That is the tap-trust policy, not a
   problem with the formula; `brew install` itself works either way.
