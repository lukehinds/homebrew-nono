# Homebrew Tap for nono

This tap provides the [nono](https://github.com/lukehinds/nono) sandbox shell and related packaging.

## Installation

### macOS (Homebrew)

```bash
brew tap lukehinds/nono
brew install nono
```

### Arch Linux (AUR)

```bash
# Using yay
yay -S nono

# Using paru
paru -S nono

# Manual installation
git clone https://aur.archlinux.org/nono.git
cd nono
makepkg -si
```

### From crates.io

```bash
cargo install nono-rs
```

### From source

```bash
git clone https://github.com/lukehinds/nono
cd nono
cargo build --release
```

## What is nono?

nono ("the opposite of YOLO") is a capability-based shell for running untrusted AI agents with OS-enforced isolation:

- **Linux**: Uses Landlock for filesystem and network sandboxing
- **macOS**: Uses Seatbelt for sandboxing

## Usage

```bash
# Run a command with filesystem access only to current directory
nono run --allow . -- your-command

# Block network access
nono run --allow . --net-block -- your-command

# Check why a path would be blocked
nono why /path/to/check
```

## More Information

See the [main repository](https://github.com/lukehinds/nono) for full documentation.

## License

Apache-2.0
