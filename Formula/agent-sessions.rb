class AgentSessions < Formula
  desc "List pi/Claude Code sessions with tokens, cost, and duration"
  homepage "https://github.com/jrdmcgr/agent-sessions"
  url "https://github.com/jrdmcgr/agent-sessions/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2cf4980fa99c1eb0d7eea31901078a379d44a7211adc5bfa7ab3b3c4cad6c8a8"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sessions --version")
  end
end
