class AgentSessions < Formula
  desc "List pi/Claude Code sessions with tokens, cost, and duration"
  homepage "https://github.com/jrdmcgr/agent-sessions"
  url "https://github.com/jrdmcgr/agent-sessions/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "f2c12399209079a1969a56e0e456e71e3791f0f64be2fef51d4c68a498c8d974"
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
