# typed: strict
# frozen_string_literal: true

# Homebrew formula for tabcap, generated: do not edit in the tap. The source is the template
# packaging/homebrew/tabcap.rb in https://github.com/1A7432/tabcap; scripts/homebrew-formula.ts
# fills the version and checksums from a release's SHA256SUMS, and .github/workflows/homebrew.yml
# pushes the result here for every published release (`brew install 1A7432/tabcap/tabcap`).
# Built targets: macOS arm64, Linux x64 and arm64 (no Intel macOS build).
class Tabcap < Formula
  desc "Browser for AI agents: background tabs, a11y-tree refs, recorded traffic"
  homepage "https://github.com/1A7432/tabcap"
  version "0.7.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/1A7432/tabcap/releases/download/v0.7.4/tabcap-v0.7.4-darwin-arm64.tar.gz"
      sha256 "95652001f90669f0611233939901b03a2286dd2535b0b62b40524cc712b75619"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1A7432/tabcap/releases/download/v0.7.4/tabcap-v0.7.4-linux-x64.tar.gz"
      sha256 "48af801d809ececd07e8686a076d3afa670fa27cf9e0482c9288cf20cb83ba0d"
    end
    on_arm do
      url "https://github.com/1A7432/tabcap/releases/download/v0.7.4/tabcap-v0.7.4-linux-arm64.tar.gz"
      sha256 "4daa998e66fec489ef154ecd32b3cb3193e6545c00c59009aff277c62ceb07e2"
    end
  end

  def install
    bin.install "tabcap"
    (pkgshare/"skills").install "skills/tabcap"
    (pkgshare/"templates").install Dir["templates/*"]
    doc.install "README.md", "README.zh-CN.md"
  end

  def caveats
    <<~EOS
      Run `tabcap setup` once to download Chrome for Testing; `tabcap update` runs
      `brew upgrade tabcap` later.
      The agent skill is in #{opt_pkgshare}/skills/tabcap: copy it to
      ~/.claude/skills/tabcap (Claude Code) or your agent's skills directory.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tabcap --version")
  end
end
