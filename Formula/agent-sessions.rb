class AgentSessions < Formula
  desc "List pi/Claude Code sessions with tokens, cost, and duration"
  homepage "https://github.com/jrdmcgr/agent-sessions"
  url "https://github.com/jrdmcgr/agent-sessions/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "a0edd331c9ae0d6d738a45a4bfbd82337ae4ab7291d9e1882212dff8792f5f59"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-X main.version=#{version}"
    system "go", "build", *std_go_args(output: bin/"sessions", ldflags: ldflags), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sessions --version")
  end
end
