class Vmpk < Formula
  desc "Virtual MIDI controller for Linux, Windows and OSX"
  homepage ""
  url "https://sourceforge.net/projects/vmpk/files/vmpk/0.8.4/vmpk-0.8.4.tar.bz2"
  sha256 "492743f1dca7e9a6ed8bcaa477b3799fc118af9c8c5be10f6149d19bb4bd084e"
  license ""

  depends_on "qt@5" => :build
  depends_on "cmake" => :build

  resource "drumstick" do
    url "https://sourceforge.net/projects/drumstick/files/2.3.0/drumstick-2.3.0.tar.bz2"
    sha256 "132ab9af7504939eb1ffd3500d89e4484bc2591e8c5ade0a2f2a87e4ac9e0a8a"
  end


  def install
    system "plutil -insert LSEnvironment -xml \"<dict><key>DRUMSTICKRT</key><string>#{prefix}/lib/drumstick2</string></dict>\" cmake_admin/MacOSXBundleInfo.plist.in"

    resource("drumstick").stage {
      system "cmake", "-S", ".", "-B", "build", *std_cmake_args
      system "cd build && make install"
    }

    system "cmake", "-S", ".", "-B", "build", 
      "-DCMAKE_INSTALL_BINDIR=dist",
      "-DCMAKE_MACOSX_RPATH=1",
      "-DCMAKE_INSTALL_RPATH=#{prefix}/lib",
      *std_cmake_args
    system "cd build && make install"
  end
end
