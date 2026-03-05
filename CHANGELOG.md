## v0.2.0

### Documentation
- document BLE dependency rationale and upgrade considerations (#12)
- add supported protocols and devices section to README (#11)

### Refactoring
- remove collection dependency in favor of Dart SDK built-ins (#16)
- remove synchronized dependency (#14)
- remove rxdart dependency from SDK (#13)
- move svakom protocols into dedicated svakom/ folder (#10)

### Other Changes
- chore: upgrade Kotlin version from 1.8.22 to 2.1.0 (#17)
- ci: update pubspec.yaml version during release workflow (#15)
- chore: update readme and remove ignore rules



## v0.1.0

### Bug Fixes
- token missing issue (#5)
- remove token dependency for checkout step (#4)
- release workflow (#3)

### Documentation
- add real-world use case examples to README
- add comprehensive README and proprietary license

### Refactoring
- consolidate generic exceptions into RemoteToyDeviceException

### Other Changes
- chore: use github defaut token (#6)
- ci: add github action for trigger release workflow by tagging (#2)
- test: add critical missing unit tests (#1)
- ci: add GitHub Actions QA workflow for lint and unit tests
- ci: add conventional commits enforcement via pre-commit hook
- chore: remove unused mockito dev dependency
- chore: add pre-commit config for code quality checks
- chore: add VS Code launch config and pubspec.lock



## 0.0.1

* TODO: Describe initial release.
