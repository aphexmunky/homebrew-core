class Ired < Formula
  desc "Minimalistic hexadecimal editor designed to be used in scripts."
  homepage "https://github.com/radare/ired"
  url "https://github.com/radare/ired/archive/0.6.tar.gz"
  sha256 "c15d37b96b1a25c44435d824bd7ef1f9aea9dc191be14c78b689d3156312d58a"

  bottle do
    cellar :any_skip_relocation
    sha256 "5d10dfac87e4a4ca589a9fa76e8f9aff62625ef6358b6ab29360e79fe4a6dc35" => :sierra
    sha256 "4fc558225913b629b144661385841e63ebb167beb9900475fadb0c0e886b4997" => :el_capitan
    sha256 "de7d82b64115f1e9f84b6bdcedf8d2bbff7730092d6f8df50e3c4613b0224608" => :x86_64_linux
  end

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    input = <<-EOS.undent
      w"hello wurld"
      s+7
      r-4
      w"orld"
      q
    EOS
    pipe_output("#{bin}/ired test.text", input)
    assert_equal "hello world", (testpath/"test.text").read.chomp
  end
end
