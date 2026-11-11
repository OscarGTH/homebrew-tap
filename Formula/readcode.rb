class Readcode < Formula
  desc "Learn a language by annotating real code, then get graded on it"
  homepage "https://github.com/OscarGTH/readcode"
  url "https://github.com/OscarGTH/readcode/archive/refs/tags/v0.16.1.tar.gz"
  sha256 "5852ab63fb3f5326e802fb402be5e41a03122da3758ca9b365a2a8978d5c0173"
  license "MIT"
  head "https://github.com/OscarGTH/readcode.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/readcode --version")

    # The snippet corpus is compiled into the binary, so this exercises a real
    # install without the network or the user's progress file.
    assert_match "every line accounted for", shell_output("#{bin}/readcode check")
    assert_match "rust-001", shell_output("#{bin}/readcode list")
  end
end
