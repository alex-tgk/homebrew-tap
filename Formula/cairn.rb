class Cairn < Formula
  desc "Local-first work, memory, and context for AI coding agents"
  homepage "https://github.com/alex-tgk/cairn"
  url "https://github.com/alex-tgk/cairn/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "782f0acd7d478783c237e71356d63f027c598acea1890268be8f938ca723452d"
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
