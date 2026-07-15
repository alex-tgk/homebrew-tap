class Cairn < Formula
  desc "Local-first work, memory, and context for AI coding agents"
  homepage "https://github.com/alex-tgk/cairn"
  url "https://github.com/alex-tgk/cairn/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "d2f4fa9d7dd6f6646f9ec43ccc84f0dad72245b0ca8c3a43879ec95ef9e63d63"
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
