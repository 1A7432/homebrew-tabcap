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
  version "0.8.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/1A7432/tabcap/releases/download/v0.8.1/tabcap-v0.8.1-darwin-arm64.tar.gz"
      sha256 "be615d46ad07e21001e81571494e52a9f6acd1338c3fb9645b8c148113160a82"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1A7432/tabcap/releases/download/v0.8.1/tabcap-v0.8.1-linux-x64.tar.gz"
      sha256 "aac73b2c43b7091d61aa0e1f2d1d247f0f837705028014fed9c73a3bff0e6b4d"
    end
    on_arm do
      url "https://github.com/1A7432/tabcap/releases/download/v0.8.1/tabcap-v0.8.1-linux-arm64.tar.gz"
      sha256 "c4ff0d4fc4b1ce40dd7ac15492abfd2ac99864cef07f5d78209c1f1e7e8db2db"
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
