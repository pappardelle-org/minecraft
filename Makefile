.PHONY: all server plugins push

all: start

# Start the server
start:
	java -Xms2G -Xmx2G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -XX:+UnlockDiagnosticVMOptions -XX:+DebugNonSafepoints -Dusing.aikars.flags=https://mcflags.emc.gs/ -Daikars.new.flags=true -Dlog4j2.formatMsgNoLookups=true -jar server.jar nogui

# Update server
server:
	rm -rf server.jar
	curl https://api.pl3x.net/v2/purpur/1.18/latest/download -o server.jar
