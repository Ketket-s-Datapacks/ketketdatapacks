# Ketket Datapacks

This repository is the central index for the Ketket datapack ecosystem.

Main organization: [Ketket-s-Datapacks](https://github.com/Ketket-s-Datapacks)

This repo is not meant to be the main release home for every datapack anymore. Its job is to act as the portal, mapping source folders to the correct repositories and documenting how the project family is organized.

## What This Repository Is For

- Keeping the source workspace organized while the datapacks live in separate repositories
- Tracking which finished datapacks belong to which GitHub repositories
- Holding project-wide notes such as mapping, migration, and repository standards

## Finished Datapacks

These finished datapacks are part of the GitHub release structure.

| Datapack | Source folder | GitHub repository | Modrinth |
|---|---|---|---|
| Better Cauldron | `Better Cauldron` | [datapack-better-cauldrons](https://github.com/Ketket-s-Datapacks/datapack-better-cauldrons) | [ketkets-better-cauldrons](https://modrinth.com/datapack/ketkets-better-cauldrons) |
| Better Hanging Signs | `Better Hanging Signs` | [datapack-better-hanging-signs](https://github.com/Ketket-s-Datapacks/datapack-better-hanging-signs) | [ketkets-better-hanging-signs](https://modrinth.com/datapack/ketkets-better-hanging-signs) |
| Custom NPC | `Custom NPC` | [datapack-mannequins](https://github.com/Ketket-s-Datapacks/datapack-mannequins) | [ketkets-mannequins](https://modrinth.com/datapack/ketkets-mannequins) |
| Displaycases | `Displaycases` | [datapack-display-cases](https://github.com/Ketket-s-Datapacks/datapack-display-cases) | [ketkets-displaycases](https://modrinth.com/datapack/ketkets-displaycases) |
| EasyCoords | `EasyCoords` | [datapack-easy-coords](https://github.com/Ketket-s-Datapacks/datapack-easy-coords) | [ketkets-easycoords](https://modrinth.com/datapack/ketkets-easycoords) |
| FurniCraft | `FurniCraft` | [datapack-furnicraft](https://github.com/Ketket-s-Datapacks/datapack-furnicraft) | [ketkets-furnicraft](https://modrinth.com/datapack/ketkets-furnicraft) |
| Graves | `Graves` | [datapack-graves](https://github.com/Ketket-s-Datapacks/datapack-graves) | [ketkets-graves](https://modrinth.com/datapack/ketkets-graves) |
| Player Shops | `Player Shops` | [datapack-player-shops](https://github.com/Ketket-s-Datapacks/datapack-player-shops) | [ketkets-player-shops](https://modrinth.com/datapack/ketkets-player-shops) |
| Quick Shulker Boxes | `Quick Shulker Boxes` | [datapack-quick-shulker-boxes](https://github.com/Ketket-s-Datapacks/datapack-quick-shulker-boxes) | [ketkets-quick-shulker-boxes](https://modrinth.com/datapack/ketkets-quick-shulker-boxes) |
| SilkFortune Switch | `SilkFortune Switch` | [datapack-silk-fortune-switch](https://github.com/Ketket-s-Datapacks/datapack-silk-fortune-switch) | [ketkets-silk-fortune-switch](https://modrinth.com/datapack/ketkets-silk-fortune-switch) |
| Stackraft | `Stackraft` | [datapack-stackraft](https://github.com/Ketket-s-Datapacks/datapack-stackraft) | [ketkets-stackraft](https://modrinth.com/datapack/ketkets-stackraft) |
| TotemRefill | `TotemRefill` | [datapack-totem-refill](https://github.com/Ketket-s-Datapacks/datapack-totem-refill) | [ketkets-totem-refill](https://modrinth.com/datapack/ketkets-totem-refill) |
| Wolf Backpack | `Wolf Pack` | [datapack-wolf-backpack](https://github.com/Ketket-s-Datapacks/datapack-wolf-backpack) | [wolf-backpack](https://modrinth.com/project/wolf-backpack) |

## Out Of Scope Right Now

These are intentionally not part of the current public multi-repo release structure:

- Better Lectern
- Custom NPC Shops

The `upload` folder is local-only operational tooling and is not intended to be part of the public repository structure.

## Repository Structure

Each finished datapack now has its own repository under the organization.

Shared rules:

1. Each repository owns one finished datapack.
2. `pack.mcmeta` uses array format for `min_format` and `max_format`.
3. `load.mcfunction` includes a version string and the correct Modrinth URL.
4. `data/ketkets/advancement/main.json` is copied into each datapack repository when needed.

## Release Flow

Current release flow is simple:

1. Build the datapack zip locally.
2. Upload to Modrinth.
3. Upload the same zip to the matching GitHub repository release.

The workspace helper script used for this flow is kept locally and can publish to both destinations in one run.

## Files In This Portal Repo

- `projects.json` contains the machine-readable mapping between folders, namespaces, repositories, and Modrinth slugs.
- `docs/repo-creation-checklist.md` contains the baseline checklist for new datapack repositories.

## Notes

This repository is now a project hub, not the final destination for every datapack release.
