class Cairn < Formula
  desc "Local-first work, memory, and context for AI coding agents"
  homepage "https://github.com/alex-tgk/cairn"
  url "https://github.com/alex-tgk/cairn/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "854f50cb2871a970d7f51f818e9f592d8cc5974baccac10f0482d9786ad1c291"
  license "MIT"

  depends_on "bun" => :build

  def install
    system "bun", "run", "./scripts/build.ts"
    bin.install "dist/cairn"
  end

  test do
    ENV["CAIRN_DATA_DIR"] = testpath/"data"
    assert_match version.to_s, shell_output("#{bin}/cairn --version")

    output = shell_output("#{bin}/cairn doctor --json")
    assert_match '"integrity": "ok"', output
    assert_match '"fts5": true', output
  end
end
