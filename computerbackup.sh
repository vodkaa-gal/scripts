#!/usr/bin/env bash
rsync -r -t --delete ~/Pictures/wallpapers monarch@10.0.0.247:/store/pub/media/
rsync -r -t -p --delete ~/.config/ monarch@10.0.0.247:/store/pub/vault/backups/archconfig
rsync -r -t --delete ~/Documents/ monarch@10.0.0.247:/store/vault/backups/Documents
