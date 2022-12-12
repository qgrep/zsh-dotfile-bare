# dump

## dconf

```shell
dconf dump / > dconf-backup.txt
           /org/gnome/            # gnome settings only
```

## gsettings

```shell
gsettings list-recursively > gsettings-backup.txt
```

# Load

```shell
dconf load / < dconf-backup.txt
```

# Factory reset desktop settings

```shell
dconf reset -f /
```
