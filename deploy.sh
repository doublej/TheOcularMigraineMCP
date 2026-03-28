#!/usr/bin/env bash
set -euo pipefail

# Deploy TheOcularMigraineMCP to Quest via Windows relay
# Requires: bun, Java 21, ssh access to Windows host, Quest connected via USB

JAVA_HOME="/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
export JAVA_HOME

WINDOWS_HOST="user@192.168.178.197"
WINDOWS_APK_PATH='C:\Users\jurre\app-debug.apk'
LOCAL_APK="android/app/build/outputs/apk/debug/app-debug.apk"

echo "==> Building web + syncing Capacitor + assembling APK..."
bun run apk:debug

echo "==> Copying APK to Windows host..."
scp "$LOCAL_APK" "${WINDOWS_HOST}:~/app-debug.apk"

echo "==> Installing on Quest via ADB..."
ssh "$WINDOWS_HOST" "adb install -r \"${WINDOWS_APK_PATH}\""

echo "==> Done. App installed on Quest."
