# This workflow will build a package using Maven and then publish it to GitHub packages when a release is created
# For more information see: https://github.com/actions/setup-java#apache-maven-with-a-settings-path

name: mp.weixin

on:
  push:
    branches: [ main ]
  release:
    types: [created]
  #schedule:
  #- cron: "1/5 * * * *" #UTC Time (减8)
  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:
  
jobs:

  startup_tagui:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest,Ubuntu-20.04,ubuntu-18.04,ubuntu-16.04]
        node-version: [10.x, 12.x, 14.x]
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-node@v1
        with:
          node-version: ${{ matrix.node-version }}
      - name: Set up PHP with PECL extension
        uses: shivammathur/setup-php@v2
        with:
          php-version: '7.4'
          extensions: imagick, swoole
      - name: Set up JDK 1.8
        uses: actions/setup-java@v1
        with:
          java-version: 1.8
          server-id: github # Value of the distributionManagement/repository/id field of the pom.xml
          settings-path: ${{ github.workspace }} # location for the settings.xml file
      - name: Set up tagui v6.14.0
        # You may pin to the exact commit or the version.
        # uses: wei/wget@ca0a6b7f0fdd7ffbe9d4cec0b9696f2dc658d3c9
        uses: wei/wget@v1.1.1
        with:
          args: -O tagui.zip https://github.com/kelaberetiv/TagUI/releases/download/v6.14.0/TagUI_Linux.zip
      - run: unzip tagui.zip
      - name: Startup tagui automation
        run: |
          ./tagui/src/tagui demo.tag -h -r
      - name: Upload logs
        uses: actions/upload-artifact@v2
        with:
          name: ${{ matrix.os }}.${{ matrix.node-version }}.logs
          path: logs/*
      - name: Check Result
        run: ls -l
        
  check_workspace:
    runs-on: ubuntu-latest
    steps:
      - run: pwd
      - run: ls
      - run: ifconfig
