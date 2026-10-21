class AgentSessions < Formula
  desc "List pi/Claude Code sessions with tokens, cost, and duration"
  homepage "https://github.com/jrdmcgr/agent-sessions"
  url "https://github.com/jrdmcgr/agent-sessions/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "10153a53694f982c0ca8ef4d0198424813bdca375b1cb880426a847dadcd781c"
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
