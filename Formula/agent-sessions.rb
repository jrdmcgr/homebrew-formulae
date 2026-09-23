class AgentSessions < Formula
  desc "List pi/Claude Code sessions with tokens, cost, and duration"
  homepage "https://github.com/jrdmcgr/agent-sessions"
  url "https://github.com/jrdmcgr/agent-sessions/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "9ba5bab63ca8f71d6507d5eab097923836ba99af3733fd171c093b0d40a965a9"
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
