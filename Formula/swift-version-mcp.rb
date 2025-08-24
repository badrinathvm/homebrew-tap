class SwiftVersionMcp < Formula
  desc "Swift version MCP"
  homepage "https://github.com/badrinathvm/SwiftVersionMCP"
  url "https://github.com/badrinathvm/SwiftVersionMCP/archive/1.2.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"

  depends_on "swift"

  def install
    system "swift", "build", "--configuration", "release"
    bin.install ".build/release/SwiftVersionMCP" => "swift-version-mcp"
  end

  test do 
    system "#{bin}/swift-version-mcp", "--help"
  end
end