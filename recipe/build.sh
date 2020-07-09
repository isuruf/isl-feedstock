if [[ "$target_platform" == "amd64" || "$target_platform" == "win-64" ]]; then
  export CFLAGS="$CFLAGS -O3 -Dstrdup=_strdup"
  export ac_cv_have_decl__BitScanForward=yes
  autoreconf -iv
  ./configure --prefix=$PREFIX --with-int=imath --disable-shared || (cat config.log && false)
  patch_libtool
else
  ./configure --prefix="$PREFIX" --with-gmp-prefix="$PREFIX" --disable-static
fi
make -j$CPU_COUNT
make check
make install-strip
