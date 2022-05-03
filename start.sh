#!/bin/sh

/usr/lib/jvm/adoptopenjdk-8-hotspot-amd64/bin/java -Dlauncher.noJAnsi=true -Dfile.encoding=utf-8 -cp ServerWrapper.jar:Thermos.jar pro.gravit.launcher.server.ServerWrapper
