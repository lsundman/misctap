# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Inkscape < Formula
  url "https://gitlab.com/inkscape/inkscape.git", :using => :git, :tag => "INKSCAPE_1_1"

  depends_on "adwaita-icon-theme"
  depends_on "bdw-gc"
  depends_on "boost"
  depends_on "cairomm"
  depends_on "ccache"
  depends_on "cmake"
  depends_on "double-conversion"
  depends_on "gettext"
  depends_on "gsl"
  depends_on "gspell"
  depends_on "gtk-mac-integration"
  depends_on "gtkmm3"
  depends_on "imagemagick"
  depends_on "intltool"
  depends_on "lcms2"
  depends_on "libomp"
  depends_on "libsoup"
  depends_on "libxslt"
  depends_on "ninja"
  depends_on "poppler"
  depends_on "potrace"
  depends_on "cmake"

  def install
    system "cmake", "-S", ".", "-B", "build", "-G", "Ninja", 
      "-DCMAKE_C_COMPILER_LAUNCHER=ccache",
      "-DCMAKE_CXX_COMPILER_LAUNCHER=ccache",
      *std_cmake_args
    
    system "cd build && ninja && ninja install"

  end

end
