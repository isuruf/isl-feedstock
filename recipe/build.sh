if [[ "$target_platform" == "amd64" ]]; then
  export CFLAGS="$CFLAGS -O3 -Dstrdup=_strdup"
  ./configure --prefix=$PREFIX --with-int=imath 
  patch_libtool
else
  ./configure --prefix="$PREFIX" --with-gmp-prefix="$PREFIX"
fi
make -j$CPU_COUNT
make check
make install-strip
