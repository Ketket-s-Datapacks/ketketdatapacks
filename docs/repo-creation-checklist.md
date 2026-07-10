# Repository Creation Checklist

Use this checklist when creating a new datapack repository under the organization.

Scope for GitHub migration: only 12 finished datapacks.

## Organization Setup

- [ ] Repository is created under https://github.com/Ketket-s-Datapacks
- [ ] Repository name follows `datapack-<slug>`
- [ ] Visibility is set correctly
- [ ] Branch protection is enabled for main

## Initial Import

- [ ] Source copied from the mapped folder in `projects.json`
- [ ] Import is clean initial commit (history not migrated)
- [ ] LICENSE is present
- [ ] README.md is present
- [ ] pack.mcmeta is present
- [ ] Selected datapack exists in projects.json finished list

## Datapack Integrity

- [ ] `pack.mcmeta` uses array format for `min_format` and `max_format`
- [ ] `data/ketkets/advancement/main.json` exists
- [ ] namespace folder exists and matches `projects.json`
- [ ] load.mcfunction includes version text
- [ ] load.mcfunction Modrinth URL slug matches `projects.json`

## Release Readiness

- [ ] zip build test completed
- [ ] dry-run upload completed
- [ ] release notes prepared
- [ ] changelog updated

## Out-of-Scope Guard

- [ ] Better Lectern is excluded from GitHub migration for now
- [ ] Custom NPC Shops is excluded from GitHub migration for now
