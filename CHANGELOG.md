# CHANGELOG

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
