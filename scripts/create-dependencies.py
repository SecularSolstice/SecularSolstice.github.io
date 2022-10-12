#!/usr/bin/env python3

import os

for root, dirs, files in os.walk("songs"):
    if "Makefile" not in files:
        continue

    song_name = root.split("/")[-1]

    makefile_name = os.path.join(root, "Makefile")
    files_to_list = []
    with open(makefile_name, "r") as makefile:
        for line in makefile:
            if line.startswith("FILES_TO_LIST="):
                files_to_list = line.split("=")[1].split(" ")

    deps = " ".join(
        [os.path.join(root, "gen", f.strip()) for f in files_to_list if f.strip()]
    )
    if deps.strip():
        print("songs/%s/gen/index.html: %s" % (song_name, deps))
