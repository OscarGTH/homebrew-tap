class Readcode < Formula
  desc "Learn a language by annotating real code, then get graded on it"
  homepage "https://github.com/OscarGTH/readcode"
  url "https://github.com/OscarGTH/readcode/archive/refs/tags/v0.10.3.tar.gz"
  sha256 "6860cdafb738915ed9f7eaf646dac7ea001cd117f50ad3fbc567bb649683c7ef"
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
