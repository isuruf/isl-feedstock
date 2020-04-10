if [[ "$target_platform" == "win-64" ]]; then
  ./configure --with-int=imath CFLAGS='$CFLAGS -O3 -Dstrdup=_strdup' --prefix=$PREFIX
  patch_libtool
else
  ./configure --prefix="$PREFIX" --with-gmp-prefix="$PREFIX"
fi
make -j$CPU_COUNT
make check
make install-strip
