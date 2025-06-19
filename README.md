# homebrew-tap
My homebrew tap

Homebrew tap for my tools

## Usage

```bash
brew tap divanvisagie/homebrew-tap
brew install cgip
brew install csep
brew install runify
brew install nocol
brew install new
```

## Maintaining the Tap

This tap uses a simple Makefile-based approach for updates. You'll need the GitHub CLI (`gh`) installed.

### Update a single formula

```bash
make update-cgip     # Update cgip to latest release
make update-csep     # Update csep to latest release
make update-runify   # Update runify to latest release
make update-nocol    # Update nocol to latest release
make update-new      # Update new to latest release
```

### Update all formulae

```bash
make update-all
```

### Check latest releases

```bash
make list-releases
```

### Commit and push changes

```bash
make release
```

The Makefile automatically:
- Fetches the latest release from each GitHub repository
- Downloads the release assets and calculates SHA256 checksums
- Updates the formula files with new URLs and checksums
- Handles architecture-specific downloads (Intel/ARM for macOS)

### Requirements

- `gh` CLI tool (GitHub CLI)
- `curl` for downloading assets
- `shasum` for calculating checksums
