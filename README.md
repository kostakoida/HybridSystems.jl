# HybridSystems

| **Documentation** | **Build Status** |
|:-----------------:|:----------------:|
| [![][docs-stable-img]][docs-stable-url] | [![Build Status][build-img]][build-url]       |
| [![][docs-latest-img]][docs-latest-url] | [![Codecov branch][codecov-img]][codecov-url] |

This packages defines an interface for defining and working with [Hybrid Systems](https://en.wikipedia.org/wiki/Hybrid_system).
It also includes an implementation of this interface.

The goal of this package is twofold

* help making algorithms on Hybrid Systems independent of the particular data structure used to represent them.
* help users to try many different tools for Hybrid Systems without needed to deal with different interfaces.

The following package implements hybrid systems representations using this interface:

* [SX](https://github.com/JuliaReach/SX.jl) : SpaceEx modeling language parser

The following package implements algorithms using this interface:

* [SwitchOnSafety](https://github.com/blegat/SwitchOnSafety.jl) : Computing invariant sets of hybrid systems.
* [Reachability](https://github.com/JuliaReach/Reachability.jl) : Computing reachable states of hybrid dynamical systems.

## Documentation

- [**STABLE**][docs-stable-url] &mdash; **most recently tagged version of the documentation.**
- [**LATEST**][docs-latest-url] &mdash; *in-development version of the documentation.*

[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-latest-img]: https://img.shields.io/badge/docs-latest-blue.svg
[docs-stable-url]: https://blegat.github.io/HybridSystems.jl/stable/index.html
[docs-latest-url]: https://blegat.github.io/HybridSystems.jl/latest/index.html

[codecov-img]: http://codecov.io/github/blegat/HybridSystems.jl/coverage.svg?branch=master
[codecov-url]: http://codecov.io/github/blegat/HybridSystems.jl?branch=master

[build-img]: https://travis-ci.org/blegat/HybridSystems.jl.svg?branch=master
[build-url]: https://travis-ci.org/blegat/HybridSystems.jl
