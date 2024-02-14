# wasm-gr-hash

WASM binding for Ghostrider hashing algorithm written in C

## Installation and usage

_[Buffer](https://github.com/feross/buffer) polyfill is required for usage in browsers_

```javascript
const GR = require("@socialruins/wasm-gr-hash");

GR().then((gr) => {
  const hash = gr.digest("hello world");
});
```

## Build and test

_Docker v20+ is required_

- `$ npm run build`
- `$ npm run test`
