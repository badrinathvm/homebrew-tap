class StepperviewMcp < Formula
  desc "MCP server for generating production-ready SwiftUI StepperView code via Claude Desktop, Cursor, and VS Code"
  homepage "https://github.com/badrinathvm/StepperView"
  url "https://github.com/badrinathvm/StepperView/archive/refs/tags/2.0.3.tar.gz"
  version "2.0.3"
  sha256 "605c3090e6af97a1b6c4f63c8937ad9a2002f23174840ebccdfbb42d45919f12"

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
