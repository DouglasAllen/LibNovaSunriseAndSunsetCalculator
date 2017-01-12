# Install script for directory: C:/Users/kb9agt/github/C-lang/libNovaSunriseAndSunsetCalculator/libnova/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/Project")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/src//julian_day.h"
    "/src//dynamical_time.h"
    "/src//sidereal_time.h"
    "/src//transform.h"
    "/src//nutation.h"
    "/src//libnova.h"
    "/src//aberration.h"
    "/src//apparent_position.h"
    "/src//solar.h"
    "/src//precession.h"
    "/src//proper_motion.h"
    "/src//mercury.h"
    "/src//venus.h"
    "/src//earth.h"
    "/src//mars.h"
    "/src//jupiter.h"
    "/src//saturn.h"
    "/src//uranus.h"
    "/src//neptune.h"
    "/src//pluto.h"
    "/src//vsop87.h"
    "/src//lunar.h"
    "/src//elliptic_motion.h"
    "/src//asteroid.h"
    "/src//comet.h"
    "/src//parabolic_motion.h"
    "/src//refraction.h"
    "/src//rise_set.h"
    "/src//angular_separation.h"
    "/src//ln_types.h"
    "/src//utility.h"
    "/src//hyperbolic_motion.h"
    "/src//parallax.h"
    "/src//airmass.h"
    "/src//heliocentric_time.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "C:/Users/kb9agt/github/C-lang/libNovaSunriseAndSunsetCalculator/libnova/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
