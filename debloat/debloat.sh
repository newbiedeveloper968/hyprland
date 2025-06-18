#!/bin/bash

packages=(
  com.coloros.music
  com.oppo.market
  com.coloros.video
  com.coloros.gamespace
  com.coloros.weather.service
  com.coloros.safecenter
  com.coloros.phonemanager
  com.heytap.browser
  com.nearme.gamecenter
  com.heytap.cloud
  com.heytap.usercenter
  com.heytap.themestore
  com.google.android.youtube
  com.google.android.apps.youtube.music
  com.facebook.services
  com.facebook.katana
  com.facebook.system
  com.facebook.appmanager
  com.android.fmradio
  com.android.chrome
  com.coloros.karaoke
  com.coloros.healthcheck
  com.coloros.lockassistant
  com.coloros.relax
  com.coloros.musiclink
  com.netflix.partner.activation
  com.netflix.mediaclient
  com.google.android.apps.googleassistant
  com.coloros.compass2
  com.heytap.music
  com.heytap.market
  com.heytap.browser.overlay
  com.google.android.apps.podcasts
  com.google.android.apps.magazines
  com.google.android.apps.tachyon
  com.google.android.apps.subscriptions.red
)

for pkg in "${packages[@]}"; do
  echo "🚫 Removing $pkg..."
  adb shell pm uninstall --user 0 "$pkg"
done

echo "✅ Debloating complete. Reboot recommended."
