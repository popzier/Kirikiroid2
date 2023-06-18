Pod::Spec.new do |s|

    s.name         = "krkr2"
    s.version      = "1.0.0"
    s.summary      = "krkr2 source"
    s.description  = "krkr2"
  
    s.homepage     = "git@github.com:popzier/Kirikiroid2.git"
  
    s.license      = "MIT"
    s.author       = { "popzier" => "iamchtj@163.com" }
    s.platform     = :ios, "11.0"
                          
    s.source       = { :git => "https://github.com/popzier/Kirikiroid2", :tag => "#{s.version}" }
    
    s.dependency 'krkr2deps/SDL2'
    
    s.subspec 'core' do |sp|
      sp.source_files = [
        "core/visual/*.{h,cpp}",
        "core/base/*.{h,cpp}",
        "core/base/win32/*.{h,cpp}",
        "core/environ/*.{h,cpp}",
        "core/environ/ConfigManager/*.{h,cpp}",
        "core/environ/cocos2d/*.{h,cpp}",
        "core/environ/linux/*.{h,cpp}",
        "core/environ/apple/*.mm",
        "core/environ/ui/*.{h,cpp}",
        "core/environ/ui/extension/*.{h,cpp}",
        "core/environ/win32/SystemControl.{h,cpp}",
        "core/environ/win32/TVPWindow.h",
        "core/extension/*.{h,cpp}",
        "core/movie/*.{h,cpp}",
        "core/movie/*/*.{h,cpp}",
        "core/msg/*.{h,cpp}",
        "core/msg/win32/MsgImpl.{h,cpp}",
        "core/msg/win32/OptionsDesc.{h,cpp} ",
        "core/sound/*.{h,cpp}",
        "core/sound/win32/*.{h,cpp}",
        "core/tjs2/*.{h,cpp}",
        "core/utils/*.c",
        "core/utils/*.{h,cpp}",
        "core/utils/encoding/*.c",
        "core/utils/minizip/*.c",
        "core/utils/minizip/*.{h,cpp}",
        "core/utils/win32/*.{h,cpp}",
        "core/visual/gl/*.{h,cpp}",
        "core/visual/ogl/*.{h,cpp}",
        "core/visual/win32/*.{h,cpp}"
      ]
  
      sp.exclude_files = [
        "core/visual/Resampler.{h,cpp}",
        "core/base/win32/FuncStubs.{h,cpp}",
        "core/base/win32/SusieArchive.{h,cpp}",
        "core/environ/MainFormUnit.{h,cpp}",
        "core/sound/xmmlib.{h,cpp}",
        "core/sound/WaveFormatConverter_SSE.{h,cpp}",
        "core/visual/win32/GDIFontRasterizer.{h,cpp}",
        "core/visual/win32/NativeFreeTypeFace.{h,cpp}",
        "core/visual/win32/TVPSysFont.{h,cpp}",
        "core/visual/win32/VSyncTimingThread.{h,cpp}",
        "core/visual/LoadJXR.{h,cpp}",
        "core/visual/LoadBPG.{h,cpp}"
      ]
                         
      sp.pod_target_xcconfig = {
        'GCC_PREPROCESSOR_DEFINITIONS' => 'TJS_TEXT_OUT_CRLF=1 __STDC_CONSTANT_MACROS=1 USE_UNICODE_FSTRING=1 TJS_TEXT_OUT_CRLF=1 _7ZIP_ST=1',
        'CLANG_CXX_LANGUAGE_STANDARD' => 'c++14',
        'OTHER_CPLUSPLUSFLAGS' => '-fno-aligned-allocation -Wno-inconsistent-missing-override',
        'HEADER_SEARCH_PATHS' => [
          '${PODS_TARGET_SRCROOT}/core/',
          '${PODS_TARGET_SRCROOT}/core/base',
          '${PODS_TARGET_SRCROOT}/core/base/win32',
          '${PODS_TARGET_SRCROOT}/core/environ',
          '${PODS_TARGET_SRCROOT}/core/environ/win32',
          '${PODS_TARGET_SRCROOT}/core/environ/sdl',
          '${PODS_TARGET_SRCROOT}/core/msg',
          '${PODS_TARGET_SRCROOT}/core/msg/win32',
          '${PODS_TARGET_SRCROOT}/core/extension',
          '${PODS_TARGET_SRCROOT}/core/sound',
          '${PODS_TARGET_SRCROOT}/core/sound/win32',
          '${PODS_TARGET_SRCROOT}/core/tjs2',
          '${PODS_TARGET_SRCROOT}/core/utils',
          '${PODS_TARGET_SRCROOT}/core/utils/win32',
          '${PODS_TARGET_SRCROOT}/core/visual',
          '${PODS_TARGET_SRCROOT}/core/visual/win32',
          '${PODS_TARGET_SRCROOT}/core/visual/RenderScript/rs',
          '${PODS_TARGET_SRCROOT}/core/../plugins',
        ],
      }
    end

    s.subspec 'plugins' do |sp|
      sp.source_files = [
        'plugins/*.{h,cpp}',
        'plugins/ncbind/*.{h,cpp}',
      ]
      
      sp.pod_target_xcconfig = {
        'GCC_PREPROCESSOR_DEFINITIONS' => 'TJS_TEXT_OUT_CRLF=1 __STDC_CONSTANT_MACROS=1 USE_UNICODE_FSTRING=1 TJS_TEXT_OUT_CRLF=1 _7ZIP_ST=1 TARGET_OS_IPHONE=1',
        'CLANG_CXX_LANGUAGE_STANDARD' => 'c++14',
        'OTHER_CPLUSPLUSFLAGS' => '-fno-aligned-allocation -Wno-inconsistent-missing-override'
      }
    end
end
