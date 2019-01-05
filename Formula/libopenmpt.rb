class Libopenmpt < Formula
  desc "Software library to decode tracked music files"
  homepage "https://lib.openmpt.org/libopenmpt/"
  url "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-0.4.0+release.autotools.tar.gz"
  sha256 "5b70f8538fecdd41662008a4f50167df6c7685fdab38840c7a20eefb634cddab"

  depends_on "pkg-config" => :build

  depends_on "flac"
  depends_on "libogg"
  depends_on "libsndfile"
  depends_on "libvorbis"
  depends_on "portaudio"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--without-mpg123",
                          "--without-vorbisfile"

    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/openmpt123", "--version"
  end
end
