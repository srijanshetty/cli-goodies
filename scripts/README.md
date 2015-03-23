wallpaper.sh
------------

- This changes the wallpaper to the latest wallpaper from the specified directory.
- I've hooked ifttt to download NASA's Astronomy picture of the day to a pre-specified folder. Whenever the image gets downloaded, inotify daemon executes the wallpaper.sh script and as a consequence, the background image of my laptop changes.

stats
--------

- Compute MIN, MAX, AVG, SD for a given parameter in a file.
- The file should be of the form

```text
    1   <number>
    0   <number>
    2   <number>
    3   <number>
```

- Usage:

```shell
$ stats <index> <filename>
```

offline
-------

- Store commands to be executed later when the computer is online

```shell
$ offline <command>               #To store
$offline -x                      #To execute
```

repos
-----

- Helper for myrepos.


