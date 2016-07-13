#!/bin/bash
#
# Make releases for Linux/amd64, Linux/ARM7 (Raspberry Pi), Windows, and Mac OX X (darwin)
#
RELEASE_NAME=ot
for PROGNAME in ot otpdr; do
    echo "Making release for $PROGNAME"
    env GOOS=linux GOARCH=amd64 go build -o dist/linux_amd64/$PROGNAME cmds/$PROGNAME/$PROGNAME.go
    env GOOS=linux GOARCH=arm GOARM=7 go build -o dist/raspberrypi/$PROGNAME cmds/$PROGNAME/$PROGNAME.go
    env GOOS=windows GOARCH=amd64 go build -o dist/windows/$PROGNAME.exe cmds/$PROGNAME/$PROGNAME.go
    env GOOS=darwin	GOARCH=amd64 go build -o dist/maxosx/$PROGNAME cmds/$PROGNAME/$PROGNAME.go
done

zip -r $RELEASE_NAME-binary-release.zip README.md INSTALL.md LICENSE dist/*

