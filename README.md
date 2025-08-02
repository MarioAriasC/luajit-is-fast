# Luajit is Fast (but Crystal is faster)

| Command | Execution Time | Notes |
| ------------- | -------------- | -------------- |
| `luajit img.lua` | 1.303 s | Luajit code |
| `./clangimg-mc` | 375.1 ms | C code compiled with clang, using multiple casting |
| `./gccimg-mc` | 369.2 ms | C code compiled with gcc, using multiple casting |
| `./gccimg` | 348.9 ms | C code compiled with gccc, using single casting |
| `./clangimg` | 348.6 ms | C code compiled with clang, using  single casting |
| `luajit img_with_ffi.lua` | 346.3 ms | Luajit code with FFI |
| `./crystalimg` | 307.6 ms | Crystal code compiled with `--release` option |

```text
luajit-is-fast on  main [!?] via C v11.4.0-gcc via 🌙 v5.4.7 via 🔮 v1.17.1
❯ hyperfine -w 3 ./crystalimg
Benchmark 1: ./crystalimg
  Time (mean ± σ):     307.6 ms ±   1.4 ms    [User: 304.6 ms, System: 2.7 ms]
  Range (min … max):   306.1 ms … 310.1 ms    10 runs


luajit-is-fast on  main [!?] via C v11.4.0-gcc via 🌙 v5.4.7 via 🔮 v1.17.1 took 4s
❯ hyperfine -w 3 ./clangimg
Benchmark 1: ./clangimg
  Time (mean ± σ):     348.6 ms ±   1.1 ms    [User: 346.4 ms, System: 2.0 ms]
  Range (min … max):   347.0 ms … 349.9 ms    10 runs


luajit-is-fast on  main [!?] via C v11.4.0-gcc via 🌙 v5.4.7 via 🔮 v1.17.1 took 4s
❯ hyperfine -w 3 ./clangimg-mc
Benchmark 1: ./clangimg-mc
  Time (mean ± σ):     375.1 ms ±   1.4 ms    [User: 373.9 ms, System: 1.2 ms]
  Range (min … max):   373.4 ms … 378.0 ms    10 runs


luajit-is-fast on  main [!?] via C v11.4.0-gcc via 🌙 v5.4.7 via 🔮 v1.17.1 took 4s
❯ hyperfine -w 3 ./gccimg
Benchmark 1: ./gccimg
  Time (mean ± σ):     348.9 ms ±   1.1 ms    [User: 346.8 ms, System: 1.9 ms]
  Range (min … max):   347.7 ms … 350.9 ms    10 runs


luajit-is-fast on  main [!?] via C v11.4.0-gcc via 🌙 v5.4.7 via 🔮 v1.17.1 took 4s
❯ hyperfine -w 3 ./gccimg-mc
Benchmark 1: ./gccimg-mc
  Time (mean ± σ):     369.2 ms ±   1.1 ms    [User: 367.5 ms, System: 1.5 ms]
  Range (min … max):   367.9 ms … 371.3 ms    10 runs


luajit-is-fast on  main [!?] via C v11.4.0-gcc via 🌙 v5.4.7 via 🔮 v1.17.1 took 4s
❯ hyperfine -w 3 'luajit img_with_ffi.lua'
Benchmark 1: luajit img_with_ffi.lua
  Time (mean ± σ):     346.3 ms ±   1.5 ms    [User: 344.3 ms, System: 1.8 ms]
  Range (min … max):   344.2 ms … 348.6 ms    10 runs


luajit-is-fast on  main [!?] via C v11.4.0-gcc via 🌙 v5.4.7 via 🔮 v1.17.1 took 4s
❯ hyperfine -w 3 'luajit img.lua'
Benchmark 1: luajit img.lua
  Time (mean ± σ):      1.303 s ±  0.056 s    [User: 1.286 s, System: 0.016 s]
  Range (min … max):    1.245 s …  1.367 s    10 runs


luajit-is-fast on  main [!?] via C v11.4.0-gcc via 🌙 v5.4.7 via 🔮 v1.17.1 took 17s
```
