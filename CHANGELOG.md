# Changelog

## 2026-05-15
### Added
- None.
### Changed
- Scheduled build run.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2026-05-14
### Added
- None.
### Changed
- None.
### Fixed
- Improved HAProxy version extraction using a regex pattern.
### Removed
- None.
### Security
- None.

## 2025-10-27
### Added
- None.
### Changed
- None.
### Fixed
- Upstream changes.
### Removed
- None.
### Security
- None.

## 2025-10-21
### Added
- None.
### Changed
- None.
### Fixed
- Updated test conditional.
### Removed
- None.
### Security
- None.

## 2025-10-05
### Added
- Added full binary path usage.
### Changed
- Locked down the binary at the end of the build flow.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2025-07-28
### Added
- None.
### Changed
- Updated GitHub Actions commit message format to include run ID.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2024-04-06
### Added
- None.
### Changed
- Generated HAProxy config before related runtime steps.
- Overrode entrypoint to keep the container running.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2021-02-22
### Added
- None.
### Changed
- Removed full paths to binaries.
- Rearranged `RUN` commands.
- Updated bash `PS1`.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2020-11-22
### Added
- None.
### Changed
- Renamed variables and added support for old variable names.
- Used full paths to binaries and scripts.
- Used `sudo -E` to keep environment variables.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2020-04-14
### Added
- Lockdown busybox binary.
### Changed
- Moved package install command to its own `RUN` command.
- Moved `sudo` configuration commands to their own `RUN` command.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2020-04-13
### Added
- Added `demyx` user/group and directories.
- Added `sudo`.
### Changed
- Formatted `LABEL` and `ENV` entries.
- Set `demyx` as the container user.
- Updated entrypoint to use `sudo`.
- Moved Updates & Support section to the bottom.
- Added Usage section notice.
- Updated Travis CI script commands.
- Ran container in the background during CI.
- Updated version commands.
- Output versions to a file.
- Committed version file before other files.
### Fixed
- None.
### Removed
- None.
### Security
- None.
