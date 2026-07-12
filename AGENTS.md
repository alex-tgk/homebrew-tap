# Homebrew tap agent instructions

This repository distributes Cairn and future `alex-tgk` command-line projects through Homebrew.

## Cairn release update

1. Confirm the Cairn tag and GitHub release exist.
2. Update `Formula/cairn.rb` with the immutable tag URL and SHA256.
3. Run `brew audit --strict --online alex-tgk/tap/cairn`.
4. Reinstall from source with `brew reinstall --build-from-source alex-tgk/tap/cairn`.
5. Run `brew test alex-tgk/tap/cairn` and `cairn doctor --json`.
6. Commit with a Conventional Commit and push the verified work unit.

Never update a Formula to an unverified tag, unchecksummed source, or moving branch. Keep release decisions and compatibility notes in the main [Cairn repository](https://github.com/alex-tgk/cairn).
