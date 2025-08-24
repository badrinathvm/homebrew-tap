class SwiftVersionMCP < Formula
  desc "Swift version MCP"
  homepage "https://github.com/badrinathvm/SwiftVersionMCP"
  url "https://github.com/badrinathvm/SwiftVersionMCP/archive/0.1.0.tar.gz"
  sha256 "CALCULATED_SHA256_HASH"

  depends_on "swift"

  def install
    system "swift", "build", "--configuration", "release"
    bin.install ".build/release/SwiftVersionMCP"
  end

  test do 
    system "#{bin}/swift-version-mcp", "--help"
  end
end