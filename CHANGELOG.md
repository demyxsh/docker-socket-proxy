# CHANGELOG

## 2025-10-21
- fix: update test conditional [eb8e7cc](https://github.com/demyxsh/docker-socket-proxy/commit/eb8e7cc0fc52f34f5069c4ff56a8e355e7457bf3)

## 2025-10-05
- Lockdown the binary at the end [f9bf539](https://github.com/demyxsh/docker-socket-proxy/commit/f9bf53921117e7c49cef873e7db9f22056374b25)

## 2025-07-28
- Update commit message format in GitHub Actions to include run ID instead of random quote [7f4dec7](https://github.com/demyxsh/docker-socket-proxy/commit/7f4dec7d09b82996a3484828d661b1e64facf66f)

## 2024-04-06
- Generate haproxy config first [949da29](https://github.com/demyxsh/docker-socket-proxy/commit/949da298c9144cc339bce91a1685b63042729e57)
- Override entrypoint to keep the container running [0c6d56c](https://github.com/demyxsh/docker-socket-proxy/commit/0c6d56cea39af96abfbde0b22388f78103a8149e)

## 2021-02-22
- Added
- Changed
    - Remove full paths to binaries.
    - Rearrange RUN commands.
    - Update bash PS1.
- Removed

## 2020-11-22
### Changed
- Rename variables and support old ones
- Use full paths to binaries/scripts
- Use -E flag for sudo to keep environment variables

## 2020-04-14
### Added
- Lockdown busybox binary
### Changed
- Move install packages command to its own RUN command
- Move configure sudo commands to its own RUN command

## 2020-04-13
### Added
- demyx user:group and directories
- sudo
### Changed
- Format LABEL and ENV entries
- Set demyx as the container user
- Entrypoint now uses sudo
- Move Updates & Support section to the bottom
- Add notice in Usage section
- Travis-CI
    - Update script commands
    - Run container in the background
    - Update version commands
    - Output versions to a file
    - Commit version file first before committing the rest
