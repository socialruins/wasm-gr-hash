# Guide https://web.dev/emscripting-a-c-library/
DOCKER_IMAGE=trzeci/emscripten-fastcomp

mkdir -p lib/gr-wasm-build
rm -rf js-lib/gr-wasm-build/*

docker run \
  -v $(pwd):/src \
  -w="/src" \
  $DOCKER_IMAGE \
  emcc -O3 -s WASM=1 -s EXTRA_EXPORTED_RUNTIME_METHODS='["cwrap"]' -s MODULARIZE=1 \
        -s NODEJS_CATCH_EXIT=0 -s NODEJS_CATCH_REJECTION=0 \
        -I lib/gr/*.cpp \
        -o lib/gr-wasm-build/gr-hash.js

WASM_BUILD_BASE_64=$(base64 lib/gr-wasm-build/gr-hash.wasm)

# fs.readFile/fetch of `gr-hash.wasm` isn't suitable for bundling into libraries
# Produce JS file with the wasm build base64 instead
echo 'module.exports = "'${WASM_BUILD_BASE_64}'"' > lib/gr-wasm-build/gr-hash-wasm-base64.js

rm lib/gr-wasm-build/gr-hash.wasm
