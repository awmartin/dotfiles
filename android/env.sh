#!/bin/sh

if [[ $platform = 'darwin' ]]
then
  # Installed with Homebrew.
  # Check with: /usr/libexec/java_home -V
  # Linked with:
  #   sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
  export JAVA_HOME="/opt/homebrew/Cellar/openjdk@11/11.0.16/libexec/openjdk.jdk/Contents/Home"

  # As per Android Studio installation instructions.
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
  PATH=$PATH:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools
fi
