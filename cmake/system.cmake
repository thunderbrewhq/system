# Arch defines
if(${CMAKE_SIZEOF_VOID_P} EQUAL 8)
    set(WHOA_ARCH_64 1)
    add_definitions(-DWHOA_ARCH_64=1)
elseif(${CMAKE_SIZEOF_VOID_P} EQUAL 4)
    set(WHOA_ARCH_32 1)
    add_definitions(-DWHOA_ARCH_32=1)
endif()

# System defines
set(WHOA_WIN_UNK 9999)
set(WHOA_WIN_XP 510)
set(WHOA_WIN_VISTA 600)
set(WHOA_WIN_7 610)
set(WHOA_WIN_8 620)
set(WHOA_WIN_8_1 630)
set(WHOA_WIN_10 1000)
set(WHOA_MAC_UNK 9999)
set(WHOA_MAC_10_8 1008)
set(WHOA_MAC_10_9 1009)
set(WHOA_MAC_10_10 1010)
set(WHOA_MAC_10_11 1011)
set(WHOA_MAC_10_12 1012)
set(WHOA_MAC_10_13 1013)
set(WHOA_MAC_10_14 1014)
set(WHOA_MAC_10_15 1015)
set(WHOA_MAC_11_0 1100)
set(WHOA_LINUX_UNK 9999)

if(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    set(WHOA_SYSTEM_WIN 1)
    add_definitions(-DWHOA_SYSTEM_WIN=1)
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    set(WHOA_SYSTEM_MAC 1)
    add_definitions(-DWHOA_SYSTEM_MAC=1)
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    set(WHOA_SYSTEM_LINUX 1)
    add_definitions(-DWHOA_SYSTEM_LINUX=1)
endif()

if(${WHOA_SYSTEM_WIN})
    if(${CMAKE_SYSTEM_VERSION} EQUAL "5.1")
        set(WHOA_SYSTEM_VERSION ${WHOA_WIN_XP})
    elseif(${CMAKE_SYSTEM_VERSION} EQUAL "6.0")
        set(WHOA_SYSTEM_VERSION ${WHOA_WIN_VISTA})
    elseif(${CMAKE_SYSTEM_VERSION} EQUAL "6.1")
        set(WHOA_SYSTEM_VERSION ${WHOA_WIN_7})
    elseif(${CMAKE_SYSTEM_VERSION} EQUAL "6.2")
        set(WHOA_SYSTEM_VERSION ${WHOA_WIN_8})
    elseif(${CMAKE_SYSTEM_VERSION} EQUAL "6.3")
        set(WHOA_SYSTEM_VERSION ${WHOA_WIN_8_1})
    elseif(${CMAKE_SYSTEM_VERSION} EQUAL "10.0")
        set(WHOA_SYSTEM_VERSION ${WHOA_WIN_10})
    else()
        set(WHOA_SYSTEM_VERSION ${WHOA_WIN_UNK})
    endif()

    # Windows 7 system minimum
    add_definitions(-D_WIN32_WINNT=0x601)

    add_definitions(-DWHOA_SYSTEM_VERSION=${WHOA_SYSTEM_VERSION})
elseif(${WHOA_SYSTEM_MAC})
    if(${CMAKE_SYSTEM_VERSION} EQUAL "10.8")
        set(WHOA_SYSTEM_VERSION ${WHOA_MAC_10_8})
    elseif(${CMAKE_SYSTEM_VERSION} EQUAL "10.9")
        set(WHOA_SYSTEM_VERSION ${WHOA_MAC_10_9})
    elseif(${CMAKE_SYSTEM_VERSION} EQUAL "10.10")
        set(WHOA_SYSTEM_VERSION ${WHOA_MAC_10_10})
    elseif(${CMAKE_SYSTEM_VERSION} EQUAL "10.11")
        set(WHOA_SYSTEM_VERSION ${WHOA_MAC_10_11})
    elseif(${CMAKE_SYSTEM_VERSION} EQUAL "10.12")
        set(WHOA_SYSTEM_VERSION ${WHOA_MAC_10_12})
    elseif(${CMAKE_SYSTEM_VERSION} EQUAL "10.13")
        set(WHOA_SYSTEM_VERSION ${WHOA_MAC_10_13})
    elseif(${CMAKE_SYSTEM_VERSION} EQUAL "10.14")
        set(WHOA_SYSTEM_VERSION ${WHOA_MAC_10_14})
    elseif(${CMAKE_SYSTEM_VERSION} EQUAL "10.15")
        set(WHOA_SYSTEM_VERSION ${WHOA_MAC_10_15})
    elseif(${CMAKE_SYSTEM_VERSION} EQUAL "11.0")
        set(WHOA_SYSTEM_VERSION ${WHOA_MAC_11_0})
    else()
        set(WHOA_SYSTEM_VERSION ${WHOA_MAC_UNK})
    endif()

    add_definitions(-DWHOA_SYSTEM_VERSION=${WHOA_SYSTEM_VERSION})
elseif(${WHOA_SYSTEM_LINUX})
    set(WHOA_SYSTEM_VERSION ${WHOA_LINUX_UNK})

    add_definitions(-DWHOA_SYSTEM_VERSION=${WHOA_SYSTEM_VERSION})
endif()
