# Gif-Shrink

This is just a small helper utility that bulk shrinks gif files. It does 2 things:

1. Resize the gif from a large format (eg 1024x768) to a small format (eg 800x600)
2. Compress the gif (lossy) to reduce the filesize significantly

## Prerequisites

It assumes both `imagemagick` and `gifsicle` are installed.

```
brew install imagemagick
brew install gifsicle
```

## How to use

1. Place input gifs in `./input`
2. Configure filesize and compression parameters in `shrink.sh`
3. Run `./shrink.sh`
4. Enjoy the shrinked output files
