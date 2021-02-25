#!/bin/sh
# Taken from https://medium.com/@er.mayursharma14/how-to-create-xcframework-855817f854cf

PROJECT_DIR=$(dirname "$0")
PROJECT_NAME="Lottie"
TARGET="Lottie_iOS"
SCHEME="$TARGET"
echo $PROJECT_DIR

# set framework folder name
FRAMEWORK_FOLDER_NAME="${PROJECT_NAME}"
# set framework name or read it from project by this variable
FRAMEWORK_NAME="${PROJECT_NAME}"
#xcframework path
BASE_DIR="build"
FRAMEWORK_PATH="${PROJECT_DIR}/$BASE_DIR/${FRAMEWORK_FOLDER_NAME}/${FRAMEWORK_NAME}.xcframework"
# set path for iOS simulator archive
SIMULATOR_ARCHIVE_PATH="${PROJECT_DIR}/$BASE_DIR/${FRAMEWORK_FOLDER_NAME}/simulator.xcarchive"
# set path for iOS device archive
IOS_DEVICE_ARCHIVE_PATH="${PROJECT_DIR}/$BASE_DIR/${FRAMEWORK_FOLDER_NAME}/iOS.xcarchive"
rm -rf "${PROJECT_DIR}/$BASE_DIR/${FRAMEWORK_FOLDER_NAME}"
echo "Deleted ${PROJECT_DIR}/$BASE_DIR/${FRAMEWORK_FOLDER_NAME}"
mkdir -p "${PROJECT_DIR}/$BASE_DIR/${FRAMEWORK_FOLDER_NAME}"
echo "Created ${PROJECT_DIR}/$BASE_DIR/${FRAMEWORK_FOLDER_NAME}"
echo "Archiving ${FRAMEWORK_NAME}"
xcodebuild archive -scheme ${SCHEME} -destination="iOS Simulator" -archivePath "${SIMULATOR_ARCHIVE_PATH}" -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
xcodebuild archive -scheme ${SCHEME} -destination="iOS" -archivePath "${IOS_DEVICE_ARCHIVE_PATH}" -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
#Creating XCFramework
xcodebuild -create-xcframework -framework ${SIMULATOR_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework -framework ${IOS_DEVICE_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework -output "${FRAMEWORK_PATH}"
#rm -rf "${SIMULATOR_ARCHIVE_PATH}"
#rm -rf "${IOS_DEVICE_ARCHIVE_PATH}"
open "${PROJECT_DIR}/$BASE_DIR/${FRAMEWORK_FOLDER_NAME}"
