if [[ "$target_platform" == "amd64" || "$target_platform" == "win-64" ]]; then
  export CFLAGS="$CFLAGS -O3 -Dstrdup=_strdup"
  export ac_cv_have_decl__BitScanForward=yes
  export LDFLAGS="$LDFLAGS -no-undefined"
  ./configure --prefix=$PREFIX --with-int=imath || (cat config.log && false)
  patch_libtool
else
  ./configure --prefix="$PREFIX" --with-gmp-prefix="$PREFIX"
fi
make -j$CPU_COUNT
make check
make install-strip
