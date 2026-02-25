class StepperviewMcp < Formula
  desc "MCP server for generating production-ready SwiftUI StepperView code via Claude Desktop, Cursor, and VS Code"
  homepage "https://github.com/badrinathvm/StepperView"
  url "https://github.com/badrinathvm/StepperView/archive/refs/tags/2.0.2.tar.gz"
  version "2.0.1"
  sha256 "00cdd79042920fb2fa3ff1ac8b6fd923ae270b5c263f9e37b1f681b0901c2c03"

  depends_on "swift"
  depends_on :macos

  def install
    cd "StepperViewMCP" do
      system "swift", "build", "--configuration", "release", "--disable-sandbox"
      bin.install ".build/release/stepperview-mcp"
    end
  end

  test do
    input = %({"jsonrpc":"2.0","method":"initialize","id":1,"params":{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"brew-test","version":"1.0"}}}\n)
    output = pipe_output("#{bin}/stepperview-mcp", input)
    assert_match "StepperView MCP", output
  end
end
