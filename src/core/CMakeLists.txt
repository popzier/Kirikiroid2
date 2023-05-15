project(krkr)

FILE(GLOB KRKR_SRC_FILES 
    ${CMAKE_CURRENT_SOURCE_DIR}/visual/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/base/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/base/win32/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/environ/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/environ/ConfigManager/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/environ/cocos2d/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/environ/linux/*.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/environ/apple/*.mm
    ${CMAKE_CURRENT_SOURCE_DIR}/environ/ui/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/environ/ui/extension/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/environ/win32/SystemControl.cpp 
    ${CMAKE_CURRENT_SOURCE_DIR}/extension/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/movie/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/movie/*/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/msg/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/msg/win32/MsgImpl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/msg/win32/OptionsDesc.cpp 
    ${CMAKE_CURRENT_SOURCE_DIR}/sound/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/sound/win32/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/tjs2/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/*.c
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/encoding/*.c
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/minizip/*.c
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/minizip/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/win32/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/visual/gl/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/visual/ogl/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/visual/win32/*.cpp
#    ${CMAKE_CURRENT_SOURCE_DIR}/visual/ARM/*.cpp
#    ${CMAKE_CURRENT_SOURCE_DIR}/visual/ARM/*.c
    )

list(REMOVE_ITEM KRKR_SRC_FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/visual/Resampler.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/base/win32/FuncStubs.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/base/win32/SusieArchive.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/environ/MainFormUnit.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/sound/xmmlib.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/sound/WaveFormatConverter_SSE.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/visual/win32/GDIFontRasterizer.cpp 
    ${CMAKE_CURRENT_SOURCE_DIR}/visual/win32/NativeFreeTypeFace.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/visual/win32/TVPSysFont.cpp 
	${CMAKE_CURRENT_SOURCE_DIR}/visual/win32/VSyncTimingThread.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/visual/LoadJXR.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/visual/LoadBPG.cpp
)

# message("KRKR_SRC_FILES=${KRKR_SRC_FILES}")

add_library(krkr
    STATIC
    ${KRKR_SRC_FILES}
    
)


target_include_directories(
    krkr
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/
    ${CMAKE_CURRENT_SOURCE_DIR}/base
    ${CMAKE_CURRENT_SOURCE_DIR}/base/win32 
    ${CMAKE_CURRENT_SOURCE_DIR}/environ 
    ${CMAKE_CURRENT_SOURCE_DIR}/environ/win32
    ${CMAKE_CURRENT_SOURCE_DIR}/environ/sdl 
    ${CMAKE_CURRENT_SOURCE_DIR}/msg 
    ${CMAKE_CURRENT_SOURCE_DIR}/msg/win32 
    ${CMAKE_CURRENT_SOURCE_DIR}/extension
    ${CMAKE_CURRENT_SOURCE_DIR}/sound 
    ${CMAKE_CURRENT_SOURCE_DIR}/sound/win32 
    ${CMAKE_CURRENT_SOURCE_DIR}/tjs2
    ${CMAKE_CURRENT_SOURCE_DIR}/utils 
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/win32
    ${CMAKE_CURRENT_SOURCE_DIR}/visual
    ${CMAKE_CURRENT_SOURCE_DIR}/visual/win32
    ${CMAKE_CURRENT_SOURCE_DIR}/visual/RenderScript/rs
    ${CMAKE_CURRENT_SOURCE_DIR}/../plugins
	${3rdParty4Krkr_include}
)

MESSAGE(STATUS ${3rdParty4Krkr_include})
    
target_compile_definitions(krkr 
    PUBLIC
    -DTJS_TEXT_OUT_CRLF -D__STDC_CONSTANT_MACROS -DUSE_UNICODE_FSTRING
    -DTJS_TEXT_OUT_CRLF -D_7ZIP_ST
)

target_link_libraries(krkr 
    PUBLIC
    cocos2d ext_freetype
	${3rdParty4Krkr_libs}
)


set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-inconsistent-missing-override")


