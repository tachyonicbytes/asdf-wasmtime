<div align="center">

# asdf-wasmtime [![Build](https://github.com/tachyonicbytes/asdf-wasmtime/actions/workflows/build.yml/badge.svg)](https://github.com/tachyonicbytes/asdf-wasmtime/actions/workflows/build.yml) [![Lint](https://github.com/tachyonicbytes/asdf-wasmtime/actions/workflows/lint.yml/badge.svg)](https://github.com/tachyonicbytes/asdf-wasmtime/actions/workflows/lint.yml)


[wasmtime](https://docs.wasmtime.dev/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Introduction
This plugin uses a modified version of the wasmtime installer [wasmtime-install](https://wasmtime.dev/install.sh).

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`, `xz`: generic POSIX utilities.
- `WASMTIME_HOME`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add wasmtime
# or
asdf plugin add wasmtime https://github.com/tachyonicbytes/asdf-wasmtime.git
```

wasmtime:

```shell
# Show all installable versions
asdf list-all wasmtime

# Install specific version
asdf install wasmtime latest

# Set a version globally (on your ~/.tool-versions file)
asdf global wasmtime latest

# Now wasmtime commands are available
wasmtime --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/tachyonicbytes/asdf-wasmtime/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [TachyonicBytes](https://github.com/tachyonicbytes/)
