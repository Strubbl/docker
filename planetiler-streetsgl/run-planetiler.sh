#!/bin/bash
java -Xmx4g -XX:MaxHeapFreeRatio=40 -cp planetiler-dist/target/*-with-deps.jar com.onthegomap.planetiler.examples.StreetsProfile --nodemap-type=array 2>&1 | tee >(cat > /app/data/planet.log)
