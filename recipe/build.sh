if [[ "$target_platform" == "win-64" ]]; then
  ./configure --prefix=$PREFIX --with-gmp-prefix="$PREFIX" CFLAGS='$CFLAGS -O3 -Dstrdup=_strdup'
  patch_libtool
else
  ./configure --prefix="$PREFIX" --with-gmp-prefix="$PREFIX"
fi
make -j$CPU_COUNT
make check
make install-strip
