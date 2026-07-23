class Cairn < Formula
  desc "Local-first work, memory, and context for AI coding agents"
  homepage "https://github.com/alex-tgk/cairn"
  url "https://github.com/alex-tgk/cairn/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "d3f66d374d096b5c11892a2f363e86ec5da98ec515d0a32d635e7088a0dd422a"
  license "MIT"

  depends_on "bun" => :build

  def install
    system "bun", "install", "--frozen-lockfile"
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
