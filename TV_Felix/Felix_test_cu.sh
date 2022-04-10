#!/bin/bash

TEST_SUITE=monix_test-US-AC.robot

RF_PATH=./RobotFramework/
RF="$RF_PATH"/robotframework-4.1.2.jar
SWINGLIB="$RF_PATH"/remoteswinglibrary-2.3.0.jar

REPORT_PATH=./Report/

JAVA_OPTIONS="-Duser.language=fr -Duser.country=FR"

RF_OPTIONS="--RemoveKeywords WUKS"

java $JAVA_OPTIONS -classpath "$RF" org.robotframework.RobotFramework $RF_OPTIONS -P "$SWINGLIB" --outputdir "$REPORT_PATH" "$TEST_SUITE" 2> /dev/null