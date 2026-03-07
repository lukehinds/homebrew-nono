class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/always-further/nono"
  version "0.12.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/always-further/nono/releases/download/v0.12.0/nono-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "96321b44bfbbe3b3ddc805f3c7fa0c106515124e9761ad1e4ad304b4463439f6"
    end
    on_intel do
      url "https://github.com/always-further/nono/releases/download/v0.12.0/nono-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "9b37daae345a179a010f7797ea86845c03ef4b2518c485c71925bf9799ef26ea"
    end
  end

  def install
    bin.install "nono"
  end

  def caveats
    <<~EOS
      nono uses macOS Seatbelt for sandboxing.

      Quick start:
        nono run --allow . -- your-command

      For more information:
        nono --help
        nono run --help
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nono --version")
  end
end
